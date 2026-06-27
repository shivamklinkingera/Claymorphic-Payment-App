import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';

class ElectricityBillPaymentPage extends StatelessWidget {
  const ElectricityBillPaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Electricity Bill')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          const ClayTextField(labelText: 'Consumer ID', hintText: 'Enter 10-digit ID'),
          const Spacer(),
          ClayButton(onPressed: () => context.push('/bill-success', extra: {'billerName': 'BESCOM', 'amount': 1240.0}), width: double.infinity, child: const Text('Fetch & Pay')),
        ]),
      ),
    );
  }
}
