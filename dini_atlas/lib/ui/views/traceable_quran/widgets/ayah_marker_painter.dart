import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';

class AyahMarkerPainter extends CustomPainter {
  final double x;
  final double y;
  final String polygon;

  AyahMarkerPainter({required this.x, required this.y, required this.polygon});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.amber[800]!.withOpacity(.16)
      ..style = PaintingStyle.fill;

    final Paint circlePaint = Paint()
      ..color = kcPurpleColorDark.withOpacity(.5)
      ..style = PaintingStyle.fill;

    const double radius = 6.5;
    canvas.drawCircle(Offset(x, y), radius, circlePaint);

    final List<String> points = polygon.split(' ');
    final Path path = Path();

    if (points.isNotEmpty) {
      final List<Offset> polygonPoints = points.map((point) {
        final List<String> coordinates = point.split(',');
        if (coordinates.length == 2) {
          final double px = double.parse(coordinates[0]);
          final double py = double.parse(coordinates[1]);
          return Offset(px, py);
        }
        return Offset.zero;
      }).toList();

      if (polygonPoints.length > 2) {
        path.moveTo(polygonPoints[0].dx, polygonPoints[0].dy);
        for (int i = 1; i < polygonPoints.length; i++) {
          path.lineTo(polygonPoints[i].dx, polygonPoints[i].dy);
        }
        path.close();
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
