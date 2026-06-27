import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';

class GasBillPaymentPage extends StatelessWidget {
  const GasBillPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gas Bill'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ClayTextField(hintText: 'Customer ID', prefixIcon: Icons.local_fire_department),
            const SizedBox(height: 32),
            const ClayTextField(hintText: 'Amount (Optional)', prefixIcon: Icons.currency_rupee, keyboardType: TextInputType.number),
            const SizedBox(height: 48),
            ClayButton(
              onPressed: () => context.push('/bill-success', extra: {'billerName': 'Mahanagar Gas', 'amount': 850.0}),
              width: double.infinity,
              child: const Text('Fetch Bill'),
            ),
          ],
        ),
      ),
    );
  }
}
