import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class BillPaymentSuccessPage extends StatelessWidget {
  final String billerName; final double amount;
  const BillPaymentSuccessPage({super.key, required this.billerName, required this.amount});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            const Spacer(),
            ClayContainer(width: 120, height: 120, borderRadius: 60, color: ClayColors.secondaryContainer, elevation: ClayElevation.level3, child: const Icon(Icons.check, size: 64, color: ClayColors.secondary)),
            const SizedBox(height: 32),
            const Text('Bill Paid Successfully!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('₹${amount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: ClayColors.primary)),
            const SizedBox(height: 8),
            Text('Paid to $billerName', style: const TextStyle(color: ClayColors.onSurfaceVariant)),
            const Spacer(),
            ClayButton(onPressed: () => context.go('/'), width: double.infinity, child: const Text('Back to Home')),
            const SizedBox(height: 32),
          ]),
        ),
      ),
    );
  }
}
