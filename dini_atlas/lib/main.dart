import 'package:dini_atlas/app/theme.dart';
import 'package:dini_atlas/services/remote/google/google_services.dart';
import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:dini_atlas/app/app.bottomsheets.dart';
import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      await setupLocator();
      await GoogleServices.init();
      setupDialogUi();
      setupBottomSheetUi();
      await initializeDateFormatting(ksDefaultLocale);
      AppTheme.setStatusBarColor();
      runApp(const BetterFeedback(child: MainApp()));
    },
    GoogleServices.recordError,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
        GoogleServices.observer
      ],
    );
  }
}
