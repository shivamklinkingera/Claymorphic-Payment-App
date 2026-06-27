import 'package:flutter/material.dart';
import '../theme/clay_theme.dart';
import '../../core/widgets/clay_container.dart';

enum ClayElevation { level1, level2, level3 }

class ClayContainer extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final Color? color;
  final ClayElevation elevation;
  final bool isSunken;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  const ClayContainer({
    super.key,
    this.child,
    this.borderRadius = 24,
    this.color = ClayColors.surface,
    this.elevation = ClayElevation.level2,
    this.isSunken = false,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final List<BoxShadow> shadows = [];

    if (isSunken) {
      shadows.addAll([
        BoxShadow(
          offset: const Offset(4, 4),
          blurRadius: 8,
          color: ClayColors.shadowDark.withValues(alpha: 0.5),
        ),
        BoxShadow(
          offset: const Offset(-4, -4),
          blurRadius: 8,
          color: ClayColors.shadowLight.withValues(alpha: 0.8),
        ),
      ]);
    } else {
      double offset;
      double blur;

      switch (elevation) {
        case ClayElevation.level1:
          offset = 4;
          blur = 10;
          break;
        case ClayElevation.level2:
          offset = 8;
          blur = 20;
          break;
        case ClayElevation.level3:
          offset = 12;
          blur = 24;
          break;
      }

      shadows.addAll([
        BoxShadow(
          offset: Offset(offset, offset),
          blurRadius: blur,
          color: ClayColors.shadowDark,
        ),
        BoxShadow(
          offset: Offset(-offset / 2, -offset / 2),
          blurRadius: blur / 2,
          color: ClayColors.shadowLight,
        ),
        BoxShadow(
          offset: Offset(offset / 2, offset / 2),
          blurRadius: blur / 2,
          color: Colors.black.withValues(alpha: 0.05),
        ),
      ]);
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadows,
      ),
      child: child,
    );
  }
}
