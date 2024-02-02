import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/sura_info.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:stacked/stacked.dart';

enum QuranTabs {
  sura(0, "Sûre"),
  page(1, "Sayfa"),
  following(2, "Takipli");

  final int id;
  final String name;
  const QuranTabs(this.id, this.name);
}

class QuranTabViewModel extends IndexTrackingViewModel {
  final _quranService = locator<QuranService>();
  List<SuraInfo>? suraList;


  QuranTabs get currentTab => QuranTabs.values[currentIndex];

  void init() async {
    runBusyFuture(_fetchSuraList());
  }

  Future<void> _fetchSuraList() async {
    final result = await _quranService.getSuraList();

    result.fold((data) {
      suraList = data;
      notifyListeners();
    }, (error) => setError(error.message));
  }

}
