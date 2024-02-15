import 'package:stacked/stacked.dart';

class ElifbaViewModel extends BaseViewModel {
  int _currentPageIndex = 1;
  int get currentPageIndex => _currentPageIndex;

  void nextPage() {
    _currentPageIndex++;
    notifyListeners();
  }

  void prevPage() {
    _currentPageIndex--;
    notifyListeners();
  }
}
