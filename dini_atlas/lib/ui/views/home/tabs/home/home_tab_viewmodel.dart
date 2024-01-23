import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/fetch_times_service.dart';
import 'package:dini_atlas/ui/views/home/tabs/home/home_service.dart';
import 'package:stacked/stacked.dart';

class HomeTabViewModel extends ReactiveViewModel {
  final HomeService _homeService = HomeService();
  final _prayerTimesService = locator<PrayerTimesService>();
  final _fetchTimesService = locator<FetchTimesService>();
  final _userSettingsService = locator<UserSettingsService>();

  String? currentMoonPhaseImage;
  City? userCity;

  @override
  List<ListenableServiceMixin> get listenableServices => [];

  void init() async {
    // Ana servisteki değişiklikleri dinle
    _homeService.listen();

    // Namaz vakitlerini getir
    await _getPrayerTimes();

    // Gelen namaz vakitlerini hazırla
    _homeService.calculatePrayerTime();

    // Ayın seklini getir
    _getCurrentMoonPhaseImage();

    // Kullanıcı şehrini getir
    getUserCity();
  }

  Future<void> _getPrayerTimes() async {
    final result = await _prayerTimesService.getPrayerTimes();

    result.fold(
        (times) => _homeService.prayerTimes = times,
        (ifNotUpToDate) async =>
            _homeService.prayerTimes = await _fetchTimesService.fetchTimes());

    notifyListeners();
  }

  void _getCurrentMoonPhaseImage() {
    currentMoonPhaseImage =
        _homeService.getTimesByDay(DateTime.now()).ayinSekliUrl.split("/").last;
    notifyListeners();
  }

  void getUserCity() async {
    final userSettings = await _userSettingsService.getUserSettings();
    userCity = userSettings?.city;
    notifyListeners();
  }
}
