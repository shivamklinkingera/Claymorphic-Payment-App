import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class MobileRechargePage extends StatelessWidget {
  const MobileRechargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Recharge'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ClayTextField(hintText: 'Mobile Number', prefixIcon: Icons.phone_android, keyboardType: TextInputType.phone),
            const SizedBox(height: 32),
            const Align(alignment: Alignment.centerLeft, child: Text('Recommended Plans', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
            const SizedBox(height: 16),
            _PlanCard(price: 299, validity: '28 Days', data: '1.5 GB/Day', description: 'Unlimited Voice Calls'),
            _PlanCard(price: 719, validity: '84 Days', data: '2.0 GB/Day', description: 'Disney+ Hotstar for 1 Year'),
            const SizedBox(height: 48),
            ClayButton(
              onPressed: () => context.push('/bill-success', extra: {'billerName': 'Airtel Prepaid', 'amount': 299.0}),
              width: double.infinity,
              child: const Text('Proceed to Recharge'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final double price;
  final String validity;
  final String data;
  final String description;
  const _PlanCard({required this.price, required this.validity, required this.data, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClayContainer(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('₹$price', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: ClayColors.primary)),
                  const SizedBox(height: 4),
                  Text(description, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  Text('$data • $validity', style: const TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: ClayColors.outlineVariant),
          ],
        ),
      ),
    );
  }
}
