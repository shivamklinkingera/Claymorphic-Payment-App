import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class OnboardingBillsRechargesPage extends StatelessWidget {
  const OnboardingBillsRechargesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            Expanded(child: ClayContainer(width: double.infinity, borderRadius: 48, child: Center(child: ClayContainer(width: 120, height: 120, borderRadius: 30, color: const Color(0xFFFFDDAF), child: const Icon(Icons.receipt_long, size: 64, color: ClayColors.onSurface))))),
            const SizedBox(height: 48),
            Text('Pay Bills in Seconds', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Recharge, pay electricity, water, gas bills', textAlign: TextAlign.center, style: TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 16)),
            const Spacer(),
            ClayButton(onPressed: () => context.go('/login_phone_number'), width: double.infinity, child: const Text('Get Started')),
            const SizedBox(height: 16),
            TextButton(onPressed: () => context.go('/login_phone_number'), child: const Text('Already have an account? Log in', style: TextStyle(color: ClayColors.onSurfaceVariant))),
          ]),
        ),
      ),
    );
  }
}
