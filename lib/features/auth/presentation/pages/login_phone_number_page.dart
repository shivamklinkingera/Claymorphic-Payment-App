import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class LoginPhoneNumberPage extends StatelessWidget {
  const LoginPhoneNumberPage({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 12),
            Text(
              'Login with your phone number to continue',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ClayColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 48),
            const Text(
              'Phone Number',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ClayContainer(
                  width: 80,
                  isSunken: true,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    '+91',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: ClayTextField(
                    hintText: 'Enter phone number',
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            ClayButton(
              onPressed: () => context.go('/otp_verification'),
              child: const Text('Send OTP'),
            ),
            const SizedBox(height: 32),
            const Center(
              child: Text(
                'By continuing, you agree to our Terms & Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
