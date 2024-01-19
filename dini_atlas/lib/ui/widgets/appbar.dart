import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {super.key, required this.title, this.actions, required this.leading});
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 15),
      child: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: kcPrimaryColor,
          ),
        ),
        leading: leading ??
            IconButton(
              onPressed: () => locator<NavigationService>().back(),
              icon: const Icon(Icons.arrow_back),
            ),
        actions: actions,
      ),
    );
  }
}
