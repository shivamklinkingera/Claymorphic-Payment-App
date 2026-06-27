import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class OnboardingWelcomePage extends StatelessWidget {
  const OnboardingWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              ClayContainer(
                borderRadius: 48,
                elevation: ClayElevation.level2,
                height: 400,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClayContainer(
                      width: 160,
                      height: 280,
                      borderRadius: 32,
                      elevation: ClayElevation.level1,
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Container(
                            width: 60,
                            height: 6,
                            decoration: BoxDecoration(
                              color: ClayColors.outlineVariant,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.qr_code_2, size: 80, color: ClayColors.primary),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ClayContainer(
                              height: 48,
                              borderRadius: 12,
                              color: ClayColors.primaryContainer,
                              elevation: ClayElevation.level1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const _FloatingItem(
                      top: 40,
                      left: 20,
                      color: Color(0xFFFFDDAF),
                      icon: Icons.currency_exchange,
                      iconColor: Color(0xFF7F5604),
                    ),
                    const _FloatingItem(
                      bottom: 60,
                      right: 20,
                      color: ClayColors.secondaryContainer,
                      icon: Icons.payments,
                      iconColor: ClayColors.onSecondaryContainer,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'Welcome to PayClay',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Your all-in-one payment companion',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ClayColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    decoration: const BoxDecoration(
                      color: ClayColors.outlineVariant,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: ClayColors.outlineVariant,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Semantics(
                button: true,
                label: 'Get Started',
                child: ClayButton(
                  onPressed: () => context.go('/onboarding_send_receive'),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get Started'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  GestureDetector(
                    onTap: () => context.go('/login_phone_number'),
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: ClayColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingItem extends StatelessWidget {
  final double? top, bottom, left, right;
  final Color color;
  final IconData icon;
  final Color iconColor;

  const _FloatingItem({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.color,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: ClayContainer(
        width: 64,
        height: 64,
        borderRadius: 32,
        color: color,
        elevation: ClayElevation.level2,
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
