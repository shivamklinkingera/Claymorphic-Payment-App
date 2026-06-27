import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class FaqDetailUpiPinResetPage extends StatelessWidget {
  const FaqDetailUpiPinResetPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQ')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClayContainer(
          borderRadius: 24, padding: const EdgeInsets.all(24),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('How to reset UPI PIN?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ClayColors.primary)),
            SizedBox(height: 16),
            Text('1. Go to Profile > Linked Banks\n2. Select your bank\n3. Tap Reset PIN\n4. Enter Debit Card details'),
          ]),
        ),
      ),
    );
  }
}
