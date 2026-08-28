import 'package:flutter/material.dart';
import '../theme/bauhaus_theme.dart';

enum BauhausShape { circle, triangle, square }

class BauhausGlyph extends StatelessWidget {
  final BauhausShape shape;
  final double size;
  final Color color;
  final bool hasBorder;

  const BauhausGlyph({
    super.key,
    required this.shape,
    this.size = 24.0,
    this.color = BauhausColors.vermilion,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _BauhausShapePainter(
          shape: shape,
          color: color,
          hasBorder: hasBorder,
        ),
      ),
    );
  }
}

class _BauhausShapePainter extends CustomPainter {
  final BauhausShape shape;
  final Color color;
  final bool hasBorder;

  _BauhausShapePainter({
    required this.shape,
    required this.color,
    required this.hasBorder,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = BauhausColors.ink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    switch (shape) {
      case BauhausShape.circle:
        final center = Offset(size.width / 2, size.height / 2);
        final radius = (size.width - 2) / 2;
        canvas.drawCircle(center, radius, fillPaint);
        if (hasBorder) canvas.drawCircle(center, radius, borderPaint);
        break;

      case BauhausShape.square:
        final rect = Rect.fromLTWH(1, 1, size.width - 2, size.height - 2);
        canvas.drawRect(rect, fillPaint);
        if (hasBorder) canvas.drawRect(rect, borderPaint);
        break;

      case BauhausShape.triangle:
        final path = Path()
          ..moveTo(size.width / 2, 1)
          ..lineTo(size.width - 1, size.height - 1)
          ..lineTo(1, size.height - 1)
          ..close();
        canvas.drawPath(path, fillPaint);
        if (hasBorder) canvas.drawPath(path, borderPaint);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _BauhausShapePainter oldDelegate) =>
      oldDelegate.shape != shape ||
      oldDelegate.color != color ||
      oldDelegate.hasBorder != hasBorder;
}

class BauhausShapeCluster extends StatelessWidget {
  final double size;
  const BauhausShapeCluster({super.key, this.size = 22.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BauhausGlyph(shape: BauhausShape.circle, size: size, color: BauhausColors.vermilion),
        const SizedBox(width: 8),
        BauhausGlyph(shape: BauhausShape.triangle, size: size, color: BauhausColors.ochre),
        const SizedBox(width: 8),
        BauhausGlyph(shape: BauhausShape.square, size: size, color: BauhausColors.cobalt),
      ],
    );
  }
}

class BauhausSectionHeading extends StatelessWidget {
  final String title;
  final String? subtitle;
  final BauhausShape shape;
  final Color accentColor;

  const BauhausSectionHeading({
    super.key,
    required this.title,
    this.subtitle,
    this.shape = BauhausShape.square,
    this.accentColor = BauhausColors.vermilion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BauhausGlyph(shape: shape, size: 20, color: accentColor),
            const SizedBox(width: 12),
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                  ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 6),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                  color: BauhausColors.muted,
                ),
          ),
        ],
        const SizedBox(height: 14),
        Container(
          height: 3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: BauhausColors.ink,
            boxShadow: [
              BoxShadow(
                color: accentColor,
                offset: const Offset(0, 2),
                blurRadius: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
