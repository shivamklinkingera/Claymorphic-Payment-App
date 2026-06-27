import 'package:flutter/material.dart';
import 'clay_container.dart';
import '../theme/clay_theme.dart';

class ClayButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;

  const ClayButton({
    super.key,
    this.onPressed,
    required this.child,
    this.color = ClayColors.primary,
    this.borderRadius = 999,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.width,
  });

  @override
  State<ClayButton> createState() => _ClayButtonState();
}

class _ClayButtonState extends State<ClayButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: ClayContainer(
          isSunken: _isPressed,
          color: widget.color,
          borderRadius: widget.borderRadius,
          padding: widget.padding,
          width: widget.width,
          child: DefaultTextStyle.merge(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (widget.color == ClayColors.primary || widget.color == ClayColors.secondary)
                ? Colors.white
                : ClayColors.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
