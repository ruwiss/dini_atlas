import 'package:diniatlas/presentation/base/base_screen.dart';
import 'package:diniatlas/presentation/onboarding/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String onBoarding = '/onBoarding';
  static const String home = '/';

  static final _router = GoRouter(initialLocation: "/onBoarding", routes: [
    GoRoute(
      path: "/onBoarding",
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: "/",
      builder: (context, state) => BaseScreen(),
    ),
  ]);

  static GoRouter get router => _router;
}
