import 'package:flutter_test/flutter_test.dart';
import 'package:claymorphic_payclay/core/theme/clay_theme.dart';
import 'package:flutter/material.dart';

void main() {
  test('ClayTheme primary color test', () {
    expect(ClayColors.primary, const Color(0xFF2F6192));
  });
}
