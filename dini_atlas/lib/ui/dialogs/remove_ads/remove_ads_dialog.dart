import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/app/app.router.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'remove_ads_dialog_model.dart';

class RemoveAdsDialog extends StackedView<RemoveAdsDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const RemoveAdsDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(
    BuildContext context,
    RemoveAdsDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reklamları Kaldır",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kcPrimaryColorDark,
                        ),
                      ),
                      verticalSpaceTiny,
                      Text(
                        "Uygulama içerisindeki reklamları tamamen kapatın.",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  kiStar,
                  width: 40,
                ),
              ],
            ),
            verticalSpaceMedium,
            _actionButton(
              text: 'Devam et',
              onTap: () {
                FirebaseAnalytics.instance
                    .logEvent(name: "remove_ads_dialog_tap");
                Navigator.of(context, rootNavigator: true).pop();
                locator<NavigationService>().navigateToAboutView(
                  showSubscriptionView: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton({
    VoidCallback? onTap,
    required String text,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? kcPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  RemoveAdsDialogModel viewModelBuilder(BuildContext context) =>
      RemoveAdsDialogModel();
}
