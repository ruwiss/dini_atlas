import 'package:diniatlas/domain/cubits/location/location_cubit.dart';
import 'package:diniatlas/utils/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'widgets/widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  void _navigateIfLocationApproved(BuildContext context) {
    if (context.read<LocationCubit>().state is LocationApproved) {
      context.pushReplacement("/");
    } else {
      FlutterNativeSplash.remove();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _navigateIfLocationApproved(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: Center(
        child: BlocConsumer<LocationCubit, LocationState>(
          listener: (context, state) {
            if (state is LocationApproved) context.pushReplacement("/");
          },
          builder: (context, state) {
            if (state is LocationError) {
              return _locationErrorWidget(context, state.message);
            } else if (state is LocationApproved) {
              return const SizedBox();
            }
            return _onboardingWidget(context);
          },
        ),
      ),
    );
  }

  Column _onboardingWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        const OnBoardingTitle(),
        const SizedBox(height: 50),
        const OnBoardingImage(),
        const SizedBox(height: 40),
        OnBoardingButton(
          onTap: () => context.read<LocationCubit>().getLocation(),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Gizlilik Politikası",
            style: context.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _locationErrorWidget(BuildContext context, String errorMessage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_disabled,
          size: 50,
          color: context.colorScheme.onBackground.withOpacity(.8),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 250,
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: context.textTheme.displayMedium,
          ),
        ),
        const SizedBox(height: 20),
        MaterialButton(
          onPressed: () => context.read<LocationCubit>().refresh(),
          child: const Text("Yenile"),
        )
      ],
    );
  }
}
