import 'package:dini_atlas/ui/views/home/home_service.dart';
import 'package:stacked/stacked.dart';

class CountDownViewModel extends ReactiveViewModel {
  final HomeService homeService;
  CountDownViewModel({required this.homeService});

  String? get countdownTimer => homeService.countdownTimer;

  @override
  List<ListenableServiceMixin> get listenableServices => [homeService];

  void init(HomeService homeService) {
    // Ana servisteki değişiklikleri dinle
    homeService.listen();
  }
}
