import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/data/database.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class PaymentSuccessPage extends StatelessWidget {
  final Contact contact;
  final double amount;
  const PaymentSuccessPage({super.key, required this.contact, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ClayColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClayContainer(
              width: 100,
              height: 100,
              borderRadius: 50,
              color: Colors.white,
              child: const Icon(Icons.check, size: 60, color: ClayColors.secondary),
            ),
            const SizedBox(height: 32),
            const Text(
              'Payment Successful',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '₹$amount sent to ${contact.name}',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: ClayButton(
                color: Colors.white,
                onPressed: () => context.go('/'),
                child: const Text('Back to Home', style: TextStyle(color: ClayColors.secondary)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
