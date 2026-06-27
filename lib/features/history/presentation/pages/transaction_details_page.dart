import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          ClayContainer(
            borderRadius: 32, padding: const EdgeInsets.all(32),
            child: Column(children: [
              const ClayContainer(width: 64, height: 64, borderRadius: 32, color: ClayColors.secondaryContainer, child: Icon(Icons.check, color: ClayColors.secondary)),
              const SizedBox(height: 24),
              const Text('Paid Successfully', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('₹500.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: ClayColors.primary)),
              const SizedBox(height: 32),
              _row('To', 'Priya Sharma'),
              _row('Date', 'Oct 24, 2023'),
              _row('Ref ID', 'PAYCLAY123456789'),
            ]),
          )
        ]),
      ),
    );
  }
  Widget _row(String l, String v) => Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(l, style: const TextStyle(color: ClayColors.onSurfaceVariant)), Text(v, style: const TextStyle(fontWeight: FontWeight.bold))]));
}
