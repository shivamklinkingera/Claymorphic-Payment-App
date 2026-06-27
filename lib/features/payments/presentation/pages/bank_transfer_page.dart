import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';

class BankTransferPage extends StatelessWidget {
  const BankTransferPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bank Transfer')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          const ClayTextField(labelText: 'Account Number', hintText: 'Enter account number'),
          const SizedBox(height: 16),
          const ClayTextField(labelText: 'IFSC Code', hintText: 'Enter IFSC'),
          const SizedBox(height: 16),
          const ClayTextField(labelText: 'Account Holder', hintText: 'Enter name'),
          const SizedBox(height: 32),
          ClayButton(onPressed: () => Navigator.pop(context), width: double.infinity, child: const Text('Proceed')),
        ]),
      ),
    );
  }
}
