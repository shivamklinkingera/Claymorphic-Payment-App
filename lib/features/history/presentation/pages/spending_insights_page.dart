import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SpendingInsightsPage extends StatelessWidget {
  const SpendingInsightsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spending Insights')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          ClayContainer(
            borderRadius: 24, padding: const EdgeInsets.all(24),
            child: Column(children: [
              const Text('Monthly Spending', style: TextStyle(color: ClayColors.onSurfaceVariant)),
              const SizedBox(height: 8),
              const Text('₹18,240.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: ClayColors.primary)),
              const SizedBox(height: 32),
              _bar('Shopping', 0.45, ClayColors.primary),
              _bar('Bills', 0.30, ClayColors.secondary),
              _bar('Food', 0.15, const Color(0xFFFFDDAF)),
            ]),
          ),
          const SizedBox(height: 32),
          _card('You saved ₹1,200 more than last month!', Icons.trending_down),
        ]),
      ),
    );
  }
  Widget _bar(String l, double p, Color c) => Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(l), Text('${(p*100).toInt()}%')]),
      const SizedBox(height: 8),
      ClayContainer(height: 10, isSunken: true, child: FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: p, child: Container(decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(5))))),
    ]),
  );
  Widget _card(String t, IconData i) => ClayContainer(borderRadius: 20, color: ClayColors.primaryContainer, padding: const EdgeInsets.all(20), child: Row(children: [Icon(i, color: Colors.white), const SizedBox(width: 16), Expanded(child: Text(t, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))]));
}
