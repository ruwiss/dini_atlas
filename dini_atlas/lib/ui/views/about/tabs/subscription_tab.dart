import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/about/about_viewmodel.dart';
import 'package:flutter/material.dart';

class SubscriptionTab extends StatelessWidget {
  const SubscriptionTab({super.key, required this.viewModel});
  final AboutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _subscribeItem(
              id: "monthly",
              planText: "AYLIK PLAN",
              priceText: "10.00 ₺ / Ay",
            ),
            _subscribeItem(
              id: "monthly_3",
              planText: "3 AYLIK PLAN",
              priceText: "25.00 ₺ / 3 Ay",
            ),
            _subscribeItem(
              id: "yillik_1",
              planText: "1 YILLIK PLAN",
              priceText: "100.00 ₺ / 1 Yıl",
            ),
            verticalSpaceMedium,
            _actionButton(
              text: "Devam",
              onTap: viewModel.selectedPrice == null ? null : () {},
              color: kcPurpleColorLight,
            ),
            verticalSpaceMedium,
            _actionButton(
              text: "Geri Getir",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(
      {VoidCallback? onTap, required String text, Color? color}) {
    return MaterialButton(
      onPressed: onTap,
      color: color ?? kcBlueGrayColorSoft,
      disabledColor: kcBlueGrayColorSoft,
      padding: const EdgeInsets.symmetric(vertical: 12),
      splashColor: kcPrimaryColorLight.withOpacity(.3),
      highlightElevation: 3,
      shape: RoundedRectangleBorder(borderRadius: borderRadiusMedium),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: kcPrimaryColorDark,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _subscribeItem(
      {required String id,
      required String planText,
      required String priceText}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () => viewModel.onSelectPrice(id),
      child: Container(
        padding: paddingMedium,
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: kcBackgroundColor,
          borderRadius: borderRadiusMedium,
          boxShadow: [
            BoxShadow(
              color: kcShadowColor.withOpacity(.6),
              offset: const Offset(0, 0),
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  planText,
                  style: const TextStyle(
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: kcPrimaryColorDark,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  priceText,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: kcPrimaryColor,
                  ),
                ),
                verticalSpaceTiny,
                const Text(
                  "İstediğiniz zaman iptal edin",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: viewModel.selectedPrice == id
                  ? kcPurpleColorMedium
                  : kcBlueGrayColor,
              radius: 12,
              child: const Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
