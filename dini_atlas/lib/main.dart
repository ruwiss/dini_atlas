import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:dini_atlas/app/theme.dart';
import 'package:dini_atlas/services/remote/google/google_services.dart';
import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:dini_atlas/app/app.bottomsheets.dart';
import 'package:dini_atlas/app/app.dialogs.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleServices.init();
  await setupLocator();
  await initializeDateFormatting(ksDefaultLocale);
  setupDialogUi();
  setupBottomSheetUi();
  AppTheme.setStatusBarColor();
  await AndroidAlarmManager.initialize();
  runApp(const MainApp());
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
      ],
    );
  }
}
