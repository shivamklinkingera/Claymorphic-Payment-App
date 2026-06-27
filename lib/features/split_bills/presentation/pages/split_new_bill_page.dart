import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/widgets/clay_button.dart';

class SplitNewBillPage extends StatelessWidget {
  const SplitNewBillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Split Bill'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ClayTextField(hintText: 'Bill Description'),
            const SizedBox(height: 16),
            const ClayTextField(hintText: 'Total Amount', keyboardType: TextInputType.number),
            const Spacer(),
            ClayButton(
              onPressed: () => Navigator.pop(context),
              width: double.infinity,
              child: const Text('Create Split'),
            ),
          ],
        ),
      ),
    );
  }
}
