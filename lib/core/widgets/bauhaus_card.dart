import 'package:flutter/material.dart';
import '../theme/bauhaus_theme.dart';

class BauhausCard extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool enableHover;
  final double shadowOffset;
  final Color? borderColor;

  const BauhausCard({
    super.key,
    required this.child,
    this.backgroundColor = BauhausColors.surface,
    this.padding = const EdgeInsets.all(20.0),
    this.onTap,
    this.enableHover = true,
    this.shadowOffset = 4.0,
    this.borderColor,
  });

  @override
  State<BauhausCard> createState() => _BauhausCardState();
}

class _BauhausCardState extends State<BauhausCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveShadowOffset = _isHovered && widget.enableHover
        ? widget.shadowOffset + 3.0
        : widget.shadowOffset;
    final translateY = _isHovered && widget.enableHover ? -3.0 : 0.0;

    Widget cardContent = AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(0, translateY, 0),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(
          color: widget.borderColor ?? BauhausColors.ink,
          width: BauhausTheme.borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: BauhausColors.ink,
            offset: Offset(effectiveShadowOffset, effectiveShadowOffset),
            blurRadius: 0,
          ),
        ],
      ),
      padding: widget.padding,
      child: widget.child,
    );

    if (widget.onTap != null || widget.enableHover) {
      return MouseRegion(
        cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: cardContent,
        ),
      );
    }

    return cardContent;
  }
}
