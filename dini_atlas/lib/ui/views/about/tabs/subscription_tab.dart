import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/about/about_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionTab extends StatelessWidget {
  const SubscriptionTab({super.key, required this.viewModel});
  final AboutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isBusy) {
      return const CircularProgressIndicator();
    } else {
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (viewModel.customerInfo case final CustomerInfo customerInfo)
                if (customerInfo.latestExpirationDate != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "${viewModel.hasSubscription ? 'Abonelik Bitiş' : 'Sona Erdi'}: ${customerInfo.latestExpirationDate!.parseDateTimeStringAsString()}",
                      textAlign: TextAlign.center,
                    ),
                  ),
              ...List.generate(
                viewModel.packages.length,
                (index) {
                  final item =
                      SubscriptionItem.fromPackage(viewModel.packages[index]);
                  return _subscribeItem(
                    id: item.id,
                    planText: item.name,
                    priceText: item.price,
                    purchased: viewModel.isPurchased(item),
                  );
                },
              ),
              verticalSpaceMedium,
              _actionButton(
                text: "Devam",
                onTap: viewModel.selectedPrice == null
                    ? null
                    : viewModel.onSelectSubscription,
                color: kcPurpleColorLight,
              ),
              verticalSpace(15),
              _actionButton(
                text: "Geri Getir",
                onTap: viewModel.onSelectRestore,
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      );
    }
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

  Widget _subscribeItem({
    required String id,
    required String planText,
    required String priceText,
    bool purchased = false,
  }) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () => viewModel.onSelectPrice(id),
      child: Container(
        padding: paddingMedium,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
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
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: purchased ? kcGrayColor : kcPrimaryColor,
                  ),
                ),
                verticalSpaceTiny,
                Text(
                  purchased
                      ? "✔️ Abone olundu"
                      : viewModel.hasSubscription
                          ? "Aboneliğinizi yükseltin"
                          : "İstediğiniz zaman iptal edin",
                  style: TextStyle(
                    fontSize: 14,
                    color: purchased ? Colors.green : null,
                    fontWeight: purchased ? FontWeight.w500 : null,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: purchased
                  ? Colors.green
                  : viewModel.selectedPrice == id
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
