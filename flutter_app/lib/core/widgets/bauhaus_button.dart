import 'package:flutter/material.dart';
import '../theme/bauhaus_theme.dart';

class BauhausButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;
  final bool isPrimary;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  const BauhausButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = BauhausColors.ink,
    this.textColor = Colors.white,
    this.icon,
    this.isPrimary = false,
    this.fontSize = 14,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
  });

  factory BauhausButton.primary({
    required String label,
    required VoidCallback onPressed,
    IconData? icon,
  }) {
    return BauhausButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: BauhausColors.vermilion,
      textColor: Colors.white,
      icon: icon,
      isPrimary: true,
    );
  }

  factory BauhausButton.secondary({
    required String label,
    required VoidCallback onPressed,
    IconData? icon,
  }) {
    return BauhausButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: BauhausColors.ochre,
      textColor: BauhausColors.ink,
      icon: icon,
    );
  }

  factory BauhausButton.outline({
    required String label,
    required VoidCallback onPressed,
    IconData? icon,
  }) {
    return BauhausButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: BauhausColors.surface,
      textColor: BauhausColors.ink,
      icon: icon,
    );
  }

  @override
  State<BauhausButton> createState() => _BauhausButtonState();
}

class _BauhausButtonState extends State<BauhausButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final shadowOffset = _isPressed ? 1.0 : (_isHovered ? 5.0 : 3.0);
    final translateY = _isPressed ? 2.0 : (_isHovered ? -2.0 : 0.0);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() {
        _isHovered = false;
        _isPressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, translateY, 0),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(color: BauhausColors.ink, width: BauhausTheme.borderWidth),
            boxShadow: [
              BoxShadow(
                color: BauhausColors.ink,
                offset: Offset(shadowOffset, shadowOffset),
                blurRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: widget.fontSize + 2, color: widget.textColor),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label.toUpperCase(),
                style: TextStyle(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: widget.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
