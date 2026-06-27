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
                     ClayContainer(
                        width: 240,
                        height: 240,
                        borderRadius: 120,
                        elevation: ClayElevation.level2,
                        child: Icon(Icons.receipt_long, size: 80, color: ClayColors.secondary),
                     ),
                     Positioned(
                        top: 20,
                        left: 20,
                        child: _FloatingSmallItem(icon: Icons.lightbulb, color: Color(0xFFFFDDAF), iconColor: Color(0xFF7F5604)),
                     ),
                     Positioned(
                        top: 20,
                        right: 20,
                        child: _FloatingSmallItem(icon: Icons.tv, color: ClayColors.secondaryContainer, iconColor: ClayColors.secondary),
                     ),
                     Positioned(
                        bottom: 80,
                        right: -10,
                        child: _FloatingSmallItem(icon: Icons.water_drop, color: ClayColors.primaryContainer, iconColor: ClayColors.primary),
                     ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              // Typography
              Text(
                'Pay Bills in Seconds',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Recharge, pay electricity, water, gas bills — all from one place',
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
                ],
              ),
              const Spacer(),
              // Actions
              ClayButton(
                color: ClayColors.secondary,
                onPressed: () => context.go('/login_phone_number'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Create Account'),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => context.go('/login_phone_number'),
                child: const Text(
                  'Already have an account? Log in',
                  style: TextStyle(color: ClayColors.primary, fontWeight: FontWeight.bold),
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

class _FloatingSmallItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;

  const _FloatingSmallItem({required this.icon, required this.color, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      width: 60,
      height: 60,
      borderRadius: 30,
      color: color,
      elevation: ClayElevation.level2,
      child: Icon(icon, color: iconColor),
    );
  }
}
