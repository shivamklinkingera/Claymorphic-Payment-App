import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';
class ChangeUpiPinPage extends StatelessWidget {
  const ChangeUpiPinPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Change PIN')), body: Padding(padding: const EdgeInsets.all(24), child: Column(children: [const ClayTextField(labelText: 'Current PIN', obscureText: true), const SizedBox(height: 16), const ClayTextField(labelText: 'New PIN', obscureText: true), const Spacer(), ClayButton(onPressed: () => Navigator.pop(context), width: double.infinity, child: const Text('Change PIN'))])));
  }
}
