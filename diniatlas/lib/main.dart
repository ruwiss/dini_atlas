import 'package:diniatlas/core/locator.dart';
import 'package:diniatlas/core/router.dart';
import 'package:diniatlas/domain/cubits/location/location_cubit.dart';
import 'package:diniatlas/domain/cubits/menu/menu_cubit.dart';
import 'package:diniatlas/utils/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Native Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // State Storage
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  // Dependency Injection
  di();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => injector<LocationCubit>(),
        ),
        BlocProvider(create: (context) => MenuCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: context.theme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
