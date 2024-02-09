import 'package:dini_atlas/models/quran/sura_player.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/widgets/size_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ayah_marker_painter.dart';

class TraceableQuranWidget extends StatefulWidget {
  const TraceableQuranWidget({super.key, required this.suraPage});
  final SuraPage suraPage;

  @override
  State<TraceableQuranWidget> createState() => _TraceableQuranWidgetState();
}

class _TraceableQuranWidgetState extends State<TraceableQuranWidget> {
  final _interactiveViewerCtrl = TransformationController();

  void _setContainerScale(Size svgSize) {
    final width = screenWidth(context) * .9;
    final diff = width / svgSize.width;
    _interactiveViewerCtrl.value = Matrix4.diagonal3Values(diff, diff, 1);
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      clipBehavior: Clip.none,
      transformationController: _interactiveViewerCtrl,
      constrained: true,
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 27),
        decoration: BoxDecoration(
            color: kcGrayColorLightSoft,
            borderRadius: BorderRadius.circular(10)),
        child: widget.suraPage.x == null
            ? SvgPicture.network(widget.suraPage.page!)
            : CustomPaint(
                painter: AyahMarkerPainter(
                  x: double.parse(widget.suraPage.x!),
                  y: double.parse(widget.suraPage.y!),
                  polygon: widget.suraPage.polygon!,
                ),
                child: SizeProviderWidget(
                  onChildSize: (size) {
                    _setContainerScale(size);
                  },
                  child: SvgPicture.network(widget.suraPage.page!),
                ),
              ),
      ),
    );
  }
}
