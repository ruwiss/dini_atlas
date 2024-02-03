import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

Future<Uint8List?> shareViewAsImage(GlobalKey? key) async {
  if (key == null) return null;
  final RenderRepaintBoundary boundary =
      key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
  final ui.Image image = await boundary.toImage();
  final ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List pngBytes = byteData!.buffer.asUint8List();
  return pngBytes;
}

class ShareableView extends StatefulWidget {
  const ShareableView({super.key, required this.builder});
  final Function(GlobalKey key) builder;

  @override
  State<ShareableView> createState() => _ShareableViewState();
}

class _ShareableViewState extends State<ShareableView> {
  final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: widget.builder(_globalKey),
    );
  }
}
