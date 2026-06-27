import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';

class LoginPhoneNumberPage extends StatefulWidget {
  const LoginPhoneNumberPage({super.key});

  @override
  State<LoginPhoneNumberPage> createState() => _LoginPhoneNumberPageState();
}

class _LoginPhoneNumberPageState extends State<LoginPhoneNumberPage> {
  final TextEditingController _phoneController = TextEditingController();

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
              onPressed: () => context.go('/onboarding'),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Enter your mobile number',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ClayColors.onSurface,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We will send you a 4-digit verification code',
              style: TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 14),
            ),
            const SizedBox(height: 48),
            ClayTextField(
              controller: _phoneController,
              hintText: 'Phone number',
              keyboardType: TextInputType.phone,
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('+91', style: TextStyle(fontWeight: FontWeight.bold, color: ClayColors.onSurface)),
                    SizedBox(width: 8),
                    SizedBox(height: 24, child: VerticalDivider(width: 1)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ClayButton(
              onPressed: () => context.go('/otp_verification'),
              width: double.infinity,
              child: const Text('Send OTP'),
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Terms & Conditions Apply',
                  style: TextStyle(color: ClayColors.outline, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
