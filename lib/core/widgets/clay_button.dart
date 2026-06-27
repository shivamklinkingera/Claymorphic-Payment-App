import 'package:flutter/material.dart';
import 'clay_container.dart';
import '../theme/clay_theme.dart';
import '../../core/widgets/clay_button.dart';

class ClayButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;
  final ClayElevation elevation;

  const ClayButton({
    super.key,
    this.onPressed,
    required this.child,
    this.color = ClayColors.primary,
    this.borderRadius = 999,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.width,
    this.elevation = ClayElevation.level2,
  });

  @override
  State<ClayButton> createState() => _ClayButtonState();
}

class _ClayButtonState extends State<ClayButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.color == ClayColors.primary || widget.color == ClayColors.secondary;

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
          elevation: widget.elevation,
          child: DefaultTextStyle.merge(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDark ? Colors.white : ClayColors.onSurface,
              fontWeight: FontWeight.w800,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
