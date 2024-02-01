import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/quran/sura_model.dart';
import 'package:dini_atlas/services/remote/quran_service.dart';
import 'package:stacked/stacked.dart';

class QuranTabViewModel extends IndexTrackingViewModel {
  final _quranService = locator<QuranService>();
  List<SuraModel>? suraList;

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
