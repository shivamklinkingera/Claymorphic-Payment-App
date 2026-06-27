import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class MutualFundsPage extends StatelessWidget {
  const MutualFundsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mutual Funds')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _fund(context, 'HDFC Index Fund', 'Equity', '24.5%', ClayColors.primaryContainer),
          _fund(context, 'ICICI Prudential Bluechip', 'Equity', '21.8%', ClayColors.secondaryContainer),
        ],
      ),
    );
  }
  Widget _fund(BuildContext context, String n, String c, String r, Color col) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: ClayContainer(
      borderRadius: 20, padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () => context.push('/fund-details', extra: n),
        child: Row(children: [
          ClayContainer(width: 44, height: 44, borderRadius: 12, color: col, child: const Icon(Icons.account_balance_wallet)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(n, style: const TextStyle(fontWeight: FontWeight.bold)), Text(c, style: const TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant))])),
          Text(r, style: const TextStyle(color: ClayColors.secondary, fontWeight: FontWeight.bold)),
        ]),
      ),
    ),
  );
}
