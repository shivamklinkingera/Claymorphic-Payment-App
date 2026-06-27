import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_text_field.dart';

class BillPaymentsHubPage extends StatelessWidget {
  const BillPaymentsHubPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bill Payments')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ClayTextField(hintText: 'Search billers...', prefixIcon: Icon(Icons.search)),
          const SizedBox(height: 32),
          const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          _grid(context),
          const SizedBox(height: 32),
          const Text('Recent Bills', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          _bill(context, 'Airtel Postpaid', '₹849.00', Icons.phone_android, const Color(0xFFD1E4FF)),
          _bill(context, 'Bescom', '₹1,240.00', Icons.bolt, const Color(0xFFFFDDAF)),
        ]),
      ),
    );
  }
  Widget _grid(BuildContext context) {
    final items = [['Mobile', Icons.phone_android, '/mobile-recharge'], ['DTH', Icons.tv, '/dth-recharge'], ['Electricity', Icons.bolt, '/electricity-bill'], ['Gas', Icons.local_fire_department, '/gas-bill']];
    return GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 4, children: items.map((e) => InkWell(onTap: () => context.push(e[2] as String), child: Column(children: [ClayContainer(width: 50, height: 50, borderRadius: 15, child: Icon(e[1] as IconData)), const SizedBox(height: 4), Text(e[0] as String, style: const TextStyle(fontSize: 10))]))).toList());
  }
  Widget _bill(BuildContext context, String n, String a, IconData i, Color c) => Padding(padding: const EdgeInsets.only(bottom: 16), child: ClayContainer(borderRadius: 20, padding: const EdgeInsets.all(16), child: InkWell(onTap: () => context.push('/bill-success', extra: {'billerName': n, 'amount': 1000.0}), child: Row(children: [ClayContainer(width: 44, height: 44, borderRadius: 12, color: c, child: Icon(i)), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(n, style: const TextStyle(fontWeight: FontWeight.bold)), const Text('Due in 3 days', style: TextStyle(fontSize: 10, color: ClayColors.error))])), Text(a, style: const TextStyle(fontWeight: FontWeight.bold))]))));
}
