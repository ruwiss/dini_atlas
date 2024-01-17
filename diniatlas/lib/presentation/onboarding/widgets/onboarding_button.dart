import 'package:diniatlas/domain/cubits/location/location_cubit.dart';
import 'package:diniatlas/utils/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        final isLoading = state is LocationLoading || state is LocationApproved;

        if (isLoading) {
          return const CircularProgressIndicator();
        } else {
          return InkWell(
            onTap: onTap,
            borderRadius: _buttonBorderRadius(),
            splashColor: context.colorScheme.primary.withOpacity(.3),
            child: Ink(
              decoration: BoxDecoration(
                color: context.colorScheme.secondaryContainer,
                borderRadius: _buttonBorderRadius(),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Text(
                  "Devam Et",
                  style: context.textTheme.displayMedium!.copyWith(
                    color: context.colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  BorderRadius _buttonBorderRadius() => BorderRadius.circular(30);
}
