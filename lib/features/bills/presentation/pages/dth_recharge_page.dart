import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class DthRechargePage extends StatelessWidget {
  const DthRechargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DTH Recharge'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
             ClayContainer(
               padding: const EdgeInsets.all(20),
               child: const Column(
                 children: [
                   Text('Select Operator', style: TextStyle(fontWeight: FontWeight.bold)),
                   SizedBox(height: 16),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       _OperatorIcon(Icons.tv, 'Tata Play'),
                       _OperatorIcon(Icons.tv, 'Airtel DTH'),
                       _OperatorIcon(Icons.tv, 'Dish TV'),
                     ],
                   ),
                 ],
               ),
             ),
             const SizedBox(height: 32),
             const ClayTextField(hintText: 'Customer ID', prefixIcon: Icons.account_circle_outlined),
             const SizedBox(height: 16),
             const ClayTextField(hintText: 'Amount', prefixIcon: Icons.currency_rupee, keyboardType: TextInputType.number),
             const SizedBox(height: 48),
             ClayButton(
               onPressed: () => context.push('/bill-success', extra: {'billerName': 'Tata Play', 'amount': 399.0}),
               width: double.infinity,
               child: const Text('Recharge Now'),
             ),
          ],
        ),
      ),
    );
  }
}

class _OperatorIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _OperatorIcon(this.icon, this.label);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClayContainer(width: 56, height: 56, borderRadius: 28, child: Icon(icon, color: ClayColors.primary)),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
