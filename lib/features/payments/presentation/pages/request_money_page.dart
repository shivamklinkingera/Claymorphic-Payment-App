import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';

class RequestMoneyPage extends StatelessWidget {
  const RequestMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request Money'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClayContainer(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text('Enter UPI ID or Mobile', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const ClayTextField(hintText: 'e.g. rahul@payclay'),
                  const SizedBox(height: 32),
                  const Text('Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const ClayTextField(hintText: '₹ 0', keyboardType: TextInputType.number),
                  const SizedBox(height: 32),
                  ClayButton(
                    onPressed: () => context.push('/request-success'),
                    width: double.infinity,
                    child: const Text('Request Money'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
