import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClayContainer(
            borderRadius: 999,
            elevation: ClayElevation.level1,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: ClayColors.primary),
              onPressed: () => context.pop(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Verify OTP',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 12),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ClayColors.onSurfaceVariant),
                children: [
                  const TextSpan(text: 'We sent a 4-digit code to '),
                  TextSpan(
                    text: '+91 98765 43210',
                    style: TextStyle(fontWeight: FontWeight.bold, color: ClayColors.onSurface),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _OtpBox(index == 0)),
            ),
            const SizedBox(height: 48),
            ClayButton(
              onPressed: () => context.go('/set_mpin'),
              child: const Text('Verify & Continue'),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive code? "),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Resend in 30s',
                    style: TextStyle(color: ClayColors.primary, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  final bool isActive;
  const _OtpBox(this.isActive);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      width: 64,
      height: 64,
      isSunken: !isActive,
      elevation: isActive ? ClayElevation.level2 : ClayElevation.level1,
      borderRadius: 16,
      child: Center(
        child: Text(
          isActive ? '4' : '',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
