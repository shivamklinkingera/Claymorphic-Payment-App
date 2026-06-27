import 'package:flutter/material.dart';
import 'clay_container.dart';
import '../theme/clay_theme.dart';
import '../../core/widgets/clay_text_field.dart';

class ClayTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  const ClayTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      isSunken: true,
      borderRadius: 24,
      color: ClayColors.background.withValues(alpha: 0.5),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: ClayColors.onSurfaceVariant) : null,
          border: InputBorder.none,
          hintStyle: TextStyle(color: ClayColors.onSurfaceVariant.withValues(alpha: 0.5)),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
  }
}
