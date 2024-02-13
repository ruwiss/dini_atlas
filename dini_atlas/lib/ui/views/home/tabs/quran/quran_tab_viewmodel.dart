import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:stacked/stacked.dart';

enum QuranTabs {
  sura(0, "Sûre"),
  page(1, "Sayfa"),
  traceable(2, "Takipli");

  final int id;
  final String name;
  const QuranTabs(this.id, this.name);
}

class QuranTabViewModel extends IndexTrackingViewModel {
  final _userSettingsService = locator<UserSettingsService>();
  final _quranService = locator<QuranService>();
  List<SuraInfo>? suraList;

  QuranTabs get currentTab => QuranTabs.values[currentIndex];

  UserSettings? _userSettings;
  UserSettings get userSettings => _userSettings!;
  LastReadAyah get lastReadAyah => userSettings.lastReadAyah;

  void init() async {
    await runBusyFuture(_getUserSettings());
    runBusyFuture(_fetchSuraList());
  }

  Future<void> _getUserSettings() async {
    _userSettings = await _userSettingsService.getUserSettings();
  }

  Future<void> _fetchSuraList() async {
    final result = await _quranService.getSuraList();

    result.fold((data) {
      suraList = data;
      notifyListeners();
    }, (error) => setError(error.message));
  }
}
