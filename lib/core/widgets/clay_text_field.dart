import 'package:flutter/material.dart';
import '../theme/clay_theme.dart';
import 'clay_container.dart';

class ClayTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;

  const ClayTextField({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Text(
              labelText!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ClayColors.onSurfaceVariant,
                fontSize: 14,
              ),
            ),
          ),
        ],
        ClayContainer(
          isSunken: true,
          borderRadius: 16,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              hintStyle: const TextStyle(color: ClayColors.outline),
            ),
            style: const TextStyle(color: ClayColors.onSurface),
          ),
        ),
      ],
    );
  }
}
