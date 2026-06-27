import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';
class MobileRechargePage extends StatelessWidget {
  const MobileRechargePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Mobile Recharge')), body: Padding(padding: const EdgeInsets.all(24), child: Column(children: [const ClayTextField(labelText: 'Mobile Number', hintText: 'Enter 10-digit number'), const Spacer(), ClayButton(onPressed: () => Navigator.pop(context), width: double.infinity, child: const Text('Proceed'))])));
  }
}
