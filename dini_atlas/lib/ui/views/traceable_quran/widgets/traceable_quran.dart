import 'dart:typed_data';
import 'package:dini_atlas/models/quran/sura_player.dart';
import 'package:dini_atlas/ui/common/ui_helpers.dart';
import 'package:dini_atlas/ui/views/traceable_quran/traceable_quran_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ayah_marker_painter.dart';

class TraceableQuranWidget extends StatefulWidget {
  const TraceableQuranWidget({super.key, required this.viewModel});
  final TraceableQuranViewModel viewModel;

  @override
  State<TraceableQuranWidget> createState() => _TraceableQuranWidgetState();
}

class _TraceableQuranWidgetState extends State<TraceableQuranWidget> {
  @override
  Widget build(BuildContext context) {
    final SuraPage suraPage = widget.viewModel.currentAyah!;
    return InteractiveViewer(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          verticalSpaceTiny,
          FutureBuilder(
            future: widget.viewModel.getUint8ListFromUrl(suraPage.page!),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString(),
                    textAlign: TextAlign.center);
              } else if (snapshot.hasData) {
                final Uint8List bytes = snapshot.data!;
                return SingleChildScrollView(
                  child: suraPage.x == null
                      ? SvgPicture.memory(bytes)
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CustomPaint(
                              painter: AyahMarkerPainter(
                                x: double.parse(suraPage.x!),
                                y: double.parse(suraPage.y!),
                                polygon: suraPage.polygon!,
                              ),
                              child: SvgPicture.memory(bytes)),
                        ),
                );
              }
              return const Text("Yükleniyor");
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
