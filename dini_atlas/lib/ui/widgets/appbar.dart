import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/services/remote/google/firebase_remote_config_service.dart';
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
  });
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool hideBackButton;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: kcPrimaryColor,
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
            BetterFeedback.of(context).showAndUploadToGitLab(
              projectId: FirebaseRemoteConfigServiceClass.i.gitlabProjectId,
              apiToken: FirebaseRemoteConfigServiceClass.i.gitlabApiToken,
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
