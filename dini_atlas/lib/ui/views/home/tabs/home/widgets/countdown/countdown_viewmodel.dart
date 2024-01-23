import 'package:dini_atlas/ui/views/home/tabs/home/home_service.dart';
import 'package:stacked/stacked.dart';

class CountDownViewModel extends ReactiveViewModel {
  final HomeService _homeService = HomeService();

  String? get countdownTimer => _homeService.countdownTimer;

  @override
  List<ListenableServiceMixin> get listenableServices => [_homeService];

  void init() {
    // Ana servisteki değişiklikleri dinle
    _homeService.listen();
  }

}
