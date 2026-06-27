import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_button.dart';

class PayclayComponentLibraryPage extends StatelessWidget {

  const PayclayComponentLibraryPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('PayclayComponentLibrary')),
    body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('This is the payclay_component_library page'),
      const SizedBox(height: 20),
      ClayButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Go Back'))
    ])),
  );
}
