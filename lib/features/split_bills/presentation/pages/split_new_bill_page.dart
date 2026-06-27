import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';

class SplitNewBillPage extends StatelessWidget {
  const SplitNewBillPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Split')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          const ClayTextField(labelText: 'Description', hintText: 'What is this for?'),
          const SizedBox(height: 24),
          const ClayTextField(labelText: 'Total Amount', hintText: '₹ 0.00', keyboardType: TextInputType.number),
          const Spacer(),
          ClayButton(onPressed: () => Navigator.pop(context), width: double.infinity, child: const Text('Create Group')),
        ]),
      ),
    );
  }
}
