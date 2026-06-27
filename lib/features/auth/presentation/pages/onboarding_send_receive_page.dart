import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class OnboardingSendReceivePage extends StatelessWidget {
  const OnboardingSendReceivePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            Expanded(child: ClayContainer(width: double.infinity, borderRadius: 48, child: Center(child: ClayContainer(width: 120, height: 120, borderRadius: 30, color: ClayColors.secondaryContainer, child: const Icon(Icons.send, size: 64, color: ClayColors.onSurface))))),
            const SizedBox(height: 48),
            Text('Send & Receive', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Instantly transfer money to anyone, anywhere', textAlign: TextAlign.center, style: TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 16)),
            const Spacer(),
            ClayButton(onPressed: () => context.go('/onboarding_bills_recharges'), width: double.infinity, child: const Text('Next')),
            const SizedBox(height: 16),
            TextButton(onPressed: () => context.go('/login_phone_number'), child: const Text('Already have an account? Log in', style: TextStyle(color: ClayColors.onSurfaceVariant))),
          ]),
        ),
      ),
    );
  }
}
