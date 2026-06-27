import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';
class GasBillPaymentPage extends StatelessWidget {
  const GasBillPaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Gas Bill')), body: Padding(padding: const EdgeInsets.all(24), child: Column(children: [const ClayTextField(labelText: 'Customer ID', hintText: 'Enter ID'), const Spacer(), ClayButton(onPressed: () => Navigator.pop(context), width: double.infinity, child: const Text('Proceed'))])));
  }
}
