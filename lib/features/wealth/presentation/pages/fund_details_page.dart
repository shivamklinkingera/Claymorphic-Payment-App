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
      appBar: AppBar(title: Text(fundName)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          ClayContainer(
            borderRadius: 24, padding: const EdgeInsets.all(24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(fundName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Equity: Large Cap', style: TextStyle(color: ClayColors.onSurfaceVariant)),
              const SizedBox(height: 24),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_info('NAV', '₹145.2'), _info('Returns', '24.5%')]),
            ]),
          ),
          const Spacer(),
          ClayButton(onPressed: () {}, width: double.infinity, child: const Text('Invest Now')),
        ]),
      ),
    );
  }
  Widget _info(String l, String v) => Column(children: [Text(l, style: const TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant)), Text(v, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]);
}
