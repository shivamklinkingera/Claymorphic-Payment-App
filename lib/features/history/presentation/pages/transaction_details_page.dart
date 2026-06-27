import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction Details'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClayContainer(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  const Icon(Icons.check_circle, size: 64, color: ClayColors.secondary),
                  const SizedBox(height: 16),
                  const Text('Payment Successful', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ClayColors.secondary)),
                  const SizedBox(height: 24),
                  const Text('₹1,500.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 32),
                  const Divider(),
                  const _InfoRow(label: 'To', value: 'Priya Sharma'),
                  const _InfoRow(label: 'UPI ID', value: 'priya@okaxis'),
                  const _InfoRow(label: 'Transaction ID', value: 'T230514123456'),
                  const _InfoRow(label: 'Date', value: '14 May 2023, 10:30 AM'),
                  const _InfoRow(label: 'From Account', value: 'SBI •••• 4521'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ClayButton(
              color: Colors.white,
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share, color: ClayColors.primary),
                  SizedBox(width: 8),
                  Text('Share Receipt', style: TextStyle(color: ClayColors.primary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: ClayColors.onSurfaceVariant)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
