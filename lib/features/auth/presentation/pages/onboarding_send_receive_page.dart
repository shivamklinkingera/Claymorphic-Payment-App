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
          child: Column(
            children: [
              const Spacer(),
              // Illustration Section
              ClayContainer(
                borderRadius: 48,
                elevation: ClayElevation.level2,
                height: 400,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                     // Illustration of sending money
                     ClayContainer(
                        width: 200,
                        height: 200,
                        borderRadius: 100,
                        elevation: ClayElevation.level2,
                        child: Icon(Icons.swap_horiz, size: 100, color: ClayColors.primary),
                     ),
                     Positioned(
                        top: 40,
                        left: 40,
                        child: ClayContainer(
                          width: 80,
                          height: 80,
                          borderRadius: 40,
                          color: ClayColors.secondaryContainer,
                          child: Icon(Icons.person, color: ClayColors.onSecondaryContainer),
                        ),
                     ),
                     Positioned(
                        bottom: 40,
                        right: 40,
                        child: ClayContainer(
                          width: 80,
                          height: 80,
                          borderRadius: 40,
                          color: ClayColors.primaryContainer,
                          child: Icon(Icons.person_outline, color: ClayColors.onPrimaryContainer),
                        ),
                     ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              // Typography
              Text(
                'Send & Receive Money',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Transfer funds instantly to anyone, anywhere with zero fees',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ClayColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: ClayColors.outlineVariant,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 32,
                    height: 12,
                    decoration: BoxDecoration(
                      color: ClayColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: ClayColors.outlineVariant,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Actions
              ClayButton(
                onPressed: () => context.go('/onboarding_bills_recharges'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Next'),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => context.go('/login_phone_number'),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: ClayColors.onSurfaceVariant, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
