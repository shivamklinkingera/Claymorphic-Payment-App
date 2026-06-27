import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class FundDetailsPage extends StatelessWidget {
  final String fundName;
  const FundDetailsPage({super.key, required this.fundName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fund Details'), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fundName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  ClayContainer(
                    height: 200,
                    width: double.infinity,
                    child: const Center(child: Icon(Icons.show_chart, size: 80, color: ClayColors.primary)),
                  ),
                  const SizedBox(height: 32),
                  const Text('Fund Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const _DetailRow(label: 'NAV', value: '₹145.20'),
                  const _DetailRow(label: 'Min Investment', value: '₹500'),
                  const _DetailRow(label: 'Expense Ratio', value: '0.85%'),
                  const _DetailRow(label: 'AUM', value: '₹32,450 Cr'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(child: ClayButton(color: Colors.white, onPressed: () {}, child: const Text('SIP', style: TextStyle(color: ClayColors.primary)))),
                const SizedBox(width: 16),
                Expanded(child: ClayButton(onPressed: () {}, child: const Text('Lumpsum'))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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
