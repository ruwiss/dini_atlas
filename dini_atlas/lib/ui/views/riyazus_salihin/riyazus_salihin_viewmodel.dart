import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/models/content_type.dart';
import 'package:dini_atlas/models/favourite.dart';
import 'package:dini_atlas/services/local/favorites_service.dart';
import 'package:dini_atlas/services/local/network_checker.dart';
import 'package:dini_atlas/services/remote/google/admob_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/views/riyazus_salihin/riyazus_salihin_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RiyazusSalihinViewModel extends BaseViewModel {
  final _networkChecker = locator<NetworkChecker>();
  final _riyazusSalihinService = RiyazusSalihinService.instance;
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _favouritesService = locator<FavouritesService>();

  final _bannerAd = AdmobBannerAdService(adUnitId: ksAdmobBanner2);
  BannerAd? get bannerAd => _bannerAd.bannerAd;
  void _loadBannerAd() => _bannerAd.loadAd(onAdLoaded: () => notifyListeners());

  final String _name = "Riyazus Salihin";

  List<Favourite>? _favourites;
  List<Favourite>? get favourites => _favourites;

  bool isInFavourites(int id) =>
      favourites?.any((e) => e.number == id && e.name == _name) ?? false;

  int _currentOffset = 0;
  int get currentOffset => _currentOffset;
  bool _isLastScroll = false;

  late List<RiyazusSalihinModel> _riyazusSalihinList;
  List<RiyazusSalihinModel> get riyazusSalihinList => _riyazusSalihinList;

  bool _filterMode = false;
  bool get filterMode => _filterMode;
  String? _filterQuery;
  String? get filterQuery => _filterQuery;

  void init() async {
    _loadBannerAd();
    await runBusyFuture(_getFavourites());
    runBusyFuture(getRiyazusSalihinList());
  }

  Future<void> _getFavourites() async {
    _favourites = await _favouritesService.getFavourites();
    notifyListeners();
  }

  Future<void> getRiyazusSalihinList({
    bool loadMore = false,
    int? id,
    String? filter,
  }) async {
    // Filtreli aramalarda loadmore yapmasın
    // Eğer gelen veri yoksa tekrar istemesin
    if (filterMode || _isLastScroll) return;

    final bool isFilterSearch = id != null || filter != null;
    if (isFilterSearch) {
      setBusy(true);
      _filterMode = true;
      _filterQuery = filter;
    }

    // aynı istekten sonra tekrar istek atma
    if (loadMore && busy(currentOffset)) return;

    setBusyForObject(currentOffset, true);

    // getir
    final result = await _riyazusSalihinService.getRiyazusSalihin(
        offset: isFilterSearch ? 0 : currentOffset, id: id, filter: filter);

    // işle
    result.fold(
      (list) {
        if (loadMore && list.isEmpty) _isLastScroll = true;
        _riyazusSalihinList = list;
        _currentOffset += 5;
      },
      (err) => setError(err.message),
    );
    notifyListeners();

    setBusyForObject(currentOffset, false);
    if (isFilterSearch) setBusy(false);
  }

  void cancelFilter() {
    _filterMode = false;
    _filterQuery = null;
    getRiyazusSalihinList();
  }

  void toggleFavorite(RiyazusSalihinModel hadis) async {
    if (isInFavourites(hadis.id)) {
      final favHadith = favourites!
          .singleWhere((e) => e.number == hadis.id && e.name == _name);
      await _favouritesService.deleteFavourite(id: favHadith.id, name: _name);
      await _getFavourites();
    } else {
      // Nesne oluştur
      final fav = Favourite()
        ..name = _name
        ..text1 = hadis.arabic
        ..text3 = hadis.turkish
        ..number = hadis.id
        ..type = EContentTypes.hadis.name;

      // Klasör seçmesi için favoriler ekranına gönder
      final result =
          await _navigationService.navigateToFavouritesView(favourite: fav);

      // Klasör seçimi sonrası gelen klasör ismiyle kayıt oluştur
      if (result is String) {
        await _favouritesService.addFavourite(fav..folder = result);
        _bottomSheetService.showBottomSheet(
          title: "Hadis favorilere eklendi.",
          description: "$result isimli klasöre kaydedildi.",
          confirmButtonTitle: "Tamam",
        );
        _getFavourites();
      }
    }
  }

  @override
  void dispose() {
    _networkChecker.dispose();
    super.dispose();
  }
}
