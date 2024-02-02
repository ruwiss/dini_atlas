import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/ayah_list.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:stacked/stacked.dart';

class QuranViewModel extends BaseViewModel {
  final _quranService = locator<QuranService>();
  AyahList? _ayahList;

  AyahList? get ayahList => _ayahList;

  void init(SuraInfo sura) async {
    getAyahList(sura.suraId);
  }

  Future<void> getAyahList(int suraId) async {
    final result = await _quranService.getSuraAyahList(suraId: suraId);

    result.fold((data) {
      _ayahList = data;
      notifyListeners();
    }, (error) {
      setError(error.message);
    });
  }

  void onSettingsTap() {}
}
