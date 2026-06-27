import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class ElectricityBillPaymentPage extends StatelessWidget {
  const ElectricityBillPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Electricity Bill'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClayContainer(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('Select Provider', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ClayContainer(
                    isSunken: true,
                    padding: const EdgeInsets.all(16),
                    child: const Row(
                      children: [
                        Icon(Icons.business, color: ClayColors.primary),
                        SizedBox(width: 16),
                        Text('Tata Power - Mumbai'),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const ClayTextField(hintText: 'Consumer Number', prefixIcon: Icons.person_outline),
            const SizedBox(height: 48),
            ClayButton(
              onPressed: () => context.push('/bill-success', extra: {'billerName': 'Tata Power', 'amount': 1240.0}),
              width: double.infinity,
              child: const Text('Proceed to Pay'),
            ),
          ],
        ),
      ),
    );
  }
}
