import 'package:account_picker/account_picker.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/remote/google/google_services.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:feedback_gitlab/feedback_gitlab.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.hideBackButton = false,
    this.backgroundColor,
    this.titleColor,
  });
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool hideBackButton;
  final Color? backgroundColor;
  final Color? titleColor;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: titleColor ?? kcPrimaryColor,
        ),
      ),
      leading: leading ??
          (hideBackButton
              ? null
              : IconButton(
                  onPressed: () => locator<NavigationService>().back(),
                  icon: const Icon(Icons.arrow_back))),
      actions: [
        IconButton(
          onPressed: () {
            BetterFeedback.of(context).show(
              (feedback) async {
                locator<BottomSheetService>()
                    .showBottomSheet(
                  title: "İletişim",
                  description:
                      "Sorunu hızlıca çözebilmemiz için e-posta adresinizi seçebilirsiniz.",
                  confirmButtonTitle: "Tamam",
                )
                    .then((_) async {
                  final emailResult = await AccountPicker.emailHint();
                  GoogleServices.uploadUserFeedBack(
                          feedback, emailResult?.email)
                      .then((value) {
                    locator<BottomSheetService>().showBottomSheet(
                      title: "Alındı",
                      description: "Geri bildiriminiz için teşekkür ederiz.",
                      confirmButtonTitle: "Kapat",
                    );
                  });
                });
              },
            );
          },
          icon: const Icon(Icons.bug_report),
        ),
        if (actions != null)
          ...actions!.map(
            (e) => Padding(padding: const EdgeInsets.only(right: 5), child: e),
          )
      ],
    );
  }
}
