import 'package:flutter/material.dart';

enum BrandIconType { linkedIn, instagram, github, email }

class BrandIcon extends StatelessWidget {
  final BrandIconType type;
  final double size;
  final Color color;

  const BrandIcon({
    super.key,
    required this.type,
    this.size = 16.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _BrandIconPainter(type: type, color: color),
      ),
    );
  }
}

class _BrandIconPainter extends CustomPainter {
  final BrandIconType type;
  final Color color;

  _BrandIconPainter({required this.type, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;

    switch (type) {
      case BrandIconType.linkedIn:
        // 'in' icon
        final rect = Rect.fromLTWH(w * 0.1, h * 0.1, w * 0.8, h * 0.8);
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(w * 0.15)),
          strokePaint,
        );
        // 'i' dot & stem
        canvas.drawCircle(Offset(w * 0.32, h * 0.35), w * 0.05, fillPaint);
        canvas.drawLine(Offset(w * 0.32, h * 0.46), Offset(w * 0.32, h * 0.72), strokePaint);
        // 'n'
        final nPath = Path()
          ..moveTo(w * 0.50, h * 0.72)
          ..lineTo(w * 0.50, h * 0.48)
          ..quadraticBezierTo(w * 0.52, h * 0.42, w * 0.62, h * 0.42)
          ..quadraticBezierTo(w * 0.70, h * 0.42, w * 0.70, h * 0.50)
          ..lineTo(w * 0.70, h * 0.72);
        canvas.drawPath(nPath, strokePaint);
        break;

      case BrandIconType.instagram:
        // camera outline
        final outerRect = Rect.fromLTWH(w * 0.1, h * 0.1, w * 0.8, h * 0.8);
        canvas.drawRRect(
          RRect.fromRectAndRadius(outerRect, Radius.circular(w * 0.22)),
          strokePaint,
        );
        // lens circle
        canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.22, strokePaint);
        // flash dot
        canvas.drawCircle(Offset(w * 0.72, h * 0.28), w * 0.04, fillPaint);
        break;

      case BrandIconType.github:
        // GitHub silhouette / cat head
        final path = Path()
          ..moveTo(w * 0.5, h * 0.1)
          ..cubicTo(w * 0.28, h * 0.1, w * 0.1, h * 0.28, w * 0.1, h * 0.5)
          ..cubicTo(w * 0.1, h * 0.68, w * 0.22, h * 0.83, w * 0.38, h * 0.88)
          ..lineTo(w * 0.38, h * 0.78)
          ..cubicTo(w * 0.32, h * 0.80, w * 0.28, h * 0.75, w * 0.26, h * 0.68)
          ..cubicTo(w * 0.24, h * 0.64, w * 0.20, h * 0.62, w * 0.18, h * 0.62)
          ..lineTo(w * 0.22, h * 0.64)
          ..cubicTo(w * 0.26, h * 0.68, w * 0.30, h * 0.76, w * 0.38, h * 0.74)
          ..cubicTo(w * 0.40, h * 0.64, w * 0.44, h * 0.60, w * 0.50, h * 0.58)
          ..cubicTo(w * 0.34, h * 0.56, w * 0.26, h * 0.48, w * 0.26, h * 0.36)
          ..cubicTo(w * 0.26, h * 0.30, w * 0.28, h * 0.25, w * 0.32, h * 0.22)
          ..lineTo(w * 0.38, h * 0.24)
          ..cubicTo(w * 0.44, h * 0.22, w * 0.56, h * 0.22, w * 0.62, h * 0.24)
          ..lineTo(w * 0.68, h * 0.22)
          ..cubicTo(w * 0.72, h * 0.25, w * 0.74, h * 0.30, w * 0.74, h * 0.36)
          ..cubicTo(w * 0.74, h * 0.48, w * 0.66, h * 0.56, w * 0.50, h * 0.58)
          ..cubicTo(w * 0.54, h * 0.62, w * 0.58, h * 0.68, w * 0.58, h * 0.76)
          ..lineTo(w * 0.58, h * 0.88)
          ..cubicTo(w * 0.74, h * 0.83, w * 0.86, h * 0.68, w * 0.86, h * 0.5)
          ..cubicTo(w * 0.86, h * 0.28, w * 0.68, h * 0.1, w * 0.5, h * 0.1)
          ..close();
        canvas.drawPath(path, fillPaint);
        break;

      case BrandIconType.email:
        // Envelope
        final envRect = Rect.fromLTWH(w * 0.1, h * 0.2, w * 0.8, h * 0.6);
        canvas.drawRect(envRect, strokePaint);
        final flap = Path()
          ..moveTo(w * 0.1, h * 0.2)
          ..lineTo(w * 0.5, h * 0.54)
          ..lineTo(w * 0.9, h * 0.2);
        canvas.drawPath(flap, strokePaint);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _BrandIconPainter oldDelegate) =>
      oldDelegate.type != type || oldDelegate.color != color;
}
