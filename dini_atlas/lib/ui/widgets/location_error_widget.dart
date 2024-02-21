import 'package:dini_atlas/ui/common/constants/app_colors.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class LocationErrorWidget extends StatelessWidget {
  const LocationErrorWidget({super.key, required this.message, this.onRetry});
  final String message;
  final Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.map, color: kcGrayColor.withOpacity(.6), size: 50),
        verticalSpaceMedium,
        SizedBox(
          width: 250,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        verticalSpaceSmall,
        TextButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.location_on),
          label: const Text(
            "Yeniden Dene",
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
