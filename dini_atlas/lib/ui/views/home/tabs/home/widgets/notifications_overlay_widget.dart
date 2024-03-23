import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsOverlayWidget extends StatelessWidget {
  NotificationsOverlayWidget({
    super.key,
    required this.controller,
    required this.child,
    required this.viewModel,
  });
  final OverlayPortalController controller;
  final Widget child;
  final HomeViewModel viewModel;

  final _link = LayerLink();

  void _hide() {
    if (controller.isShowing) controller.hide();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: controller,
        overlayChildBuilder: (context) {
          return CompositedTransformFollower(
            link: _link,
            offset: const Offset(-48, 0),
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: TapRegion(
                onTapOutside: (_) => _hide(),
                child: Container(
                  width: 140,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: kcBlueGrayColor,
                    borderRadius: borderRadiusSmall,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _overlayItem(PrayerType.imsak),
                      _overlayItem(PrayerType.gunes),
                      _overlayItem(PrayerType.ogle),
                      _overlayItem(PrayerType.ikindi),
                      _overlayItem(PrayerType.aksam),
                      _overlayItem(PrayerType.yatsi),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: child,
      ),
    );
  }

  Widget _overlayItem(PrayerType type) {
    final bool isActive = viewModel.isNotiActiveForPrayer(type);
    return InkWell(
      onTap: () {
        _hide();
        viewModel.showNotificationSettingsDialog(type);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type.text,
              style: const TextStyle(
                fontSize: 17,
                color: kcPrimaryColorDark,
                fontWeight: FontWeight.w500,
              ),
            ),
            SvgPicture.asset(
              isActive ? kiNotificationEnabled : kiNotificationDisabled,
            ),
          ],
        ),
      ),
    );
  }
}
