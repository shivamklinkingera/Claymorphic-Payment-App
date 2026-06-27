import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class SplitBillsPage extends StatelessWidget {
  const SplitBillsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Split Bills')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          ClayButton(onPressed: () => context.push('/split-new'), width: double.infinity, child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.group_add, color: Colors.white), SizedBox(width: 8), Text('New Split')])),
          const SizedBox(height: 32),
          const Text('Active Splits', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _group(context, 'Europe Trip', '₹12,450', 4, ClayColors.primaryContainer),
        ]),
      ),
    );
  }
  Widget _group(BuildContext context, String n, String a, int m, Color c) => Padding(padding: const EdgeInsets.only(bottom: 16), child: ClayContainer(borderRadius: 20, padding: const EdgeInsets.all(16), child: InkWell(onTap: () => context.push('/group-details', extra: n), child: Row(children: [ClayContainer(width: 44, height: 44, borderRadius: 12, color: c, child: const Icon(Icons.groups)), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(n, style: const TextStyle(fontWeight: FontWeight.bold)), Text('$m members', style: const TextStyle(fontSize: 10))])), Text(a, style: const TextStyle(fontWeight: FontWeight.bold, color: ClayColors.primary))]))));
}
