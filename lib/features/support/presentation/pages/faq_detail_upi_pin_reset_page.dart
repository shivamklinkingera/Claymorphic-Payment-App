import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class FaqDetailUpiPinResetPage extends StatelessWidget {
  const FaqDetailUpiPinResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset UPI PIN'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('To reset your UPI PIN, follow these steps:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            _StepItem(number: '1', text: 'Go to Profile > Linked Bank Accounts'),
            _StepItem(number: '2', text: 'Select the bank account you want to reset'),
            _StepItem(number: '3', text: 'Tap on "Reset UPI PIN"'),
            _StepItem(number: '4', text: 'Enter your Debit Card details (last 6 digits and expiry)'),
            _StepItem(number: '5', text: 'Verify with OTP and set your new PIN'),
            const SizedBox(height: 40),
            ClayContainer(
              padding: const EdgeInsets.all(20),
              color: ClayColors.secondaryContainer.withValues(alpha: 0.2),
              child: const Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: ClayColors.secondary),
                  SizedBox(width: 16),
                  Expanded(child: Text('Keep your Debit Card handy before starting.', style: TextStyle(color: ClayColors.onSecondaryContainer))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  final String number;
  final String text;
  const _StepItem({required this.number, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 12, backgroundColor: ClayColors.primary, child: Text(number, style: const TextStyle(color: Colors.white, fontSize: 12))),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }
}
