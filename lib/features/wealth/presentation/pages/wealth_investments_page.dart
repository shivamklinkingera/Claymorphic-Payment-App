import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class WealthInvestmentsPage extends StatelessWidget {
  const WealthInvestmentsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wealth')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          ClayContainer(
            borderRadius: 24, color: ClayColors.primary, padding: const EdgeInsets.all(24),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Net Worth', style: TextStyle(color: Colors.white70, fontSize: 13)),
              SizedBox(height: 8),
              Text('₹4,25,000.00', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('+2.4% this month', style: TextStyle(color: ClayColors.secondaryContainer, fontSize: 12, fontWeight: FontWeight.bold)),
            ]),
          ),
          const SizedBox(height: 32),
          _item(context, 'Mutual Funds', '₹3,50,000', Icons.analytics, ClayColors.primaryContainer, '/mutual-funds'),
          _item(context, 'Stocks', '₹50,000', Icons.show_chart, ClayColors.secondaryContainer, null),
          _item(context, 'Gold', '₹25,000', Icons.toll, const Color(0xFFFFDDAF), null),
        ]),
      ),
    );
  }
  Widget _item(BuildContext context, String t, String a, IconData i, Color c, String? r) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: ClayContainer(
      borderRadius: 20, padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: r != null ? () => context.push(r) : null,
        child: Row(children: [
          ClayContainer(width: 44, height: 44, borderRadius: 12, color: c, child: Icon(i)),
          const SizedBox(width: 16),
          Expanded(child: Text(t, style: const TextStyle(fontWeight: FontWeight.bold))),
          Text(a, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Icon(Icons.chevron_right, color: ClayColors.outlineVariant),
        ]),
      ),
    ),
  );
}
