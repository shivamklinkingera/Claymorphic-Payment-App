import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class AddMoneyToWalletPage extends StatefulWidget {
  const AddMoneyToWalletPage({super.key});

  @override
  State<AddMoneyToWalletPage> createState() => _AddMoneyToWalletPageState();
}

class _AddMoneyToWalletPageState extends State<AddMoneyToWalletPage> {
  String amount = "1000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Money'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('Enter Amount', style: TextStyle(color: ClayColors.onSurfaceVariant)),
            const SizedBox(height: 16),
            Text('₹$amount', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: ClayColors.primary)),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['500', '1000', '2000'].map((e) => GestureDetector(
                onTap: () => setState(() => amount = e),
                child: ClayContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: amount == e ? ClayColors.primary : Colors.white,
                  child: Text('₹$e', style: TextStyle(color: amount == e ? Colors.white : ClayColors.onSurface, fontWeight: FontWeight.bold)),
                ),
              )).toList(),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Select Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            ClayContainer(
              padding: const EdgeInsets.all(16),
              child: const Row(
                children: [
                  Icon(Icons.account_balance, color: ClayColors.primary),
                  SizedBox(width: 16),
                  Text('SBI Account •••• 4521', style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Icon(Icons.check_circle, color: ClayColors.primary),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ClayButton(
              onPressed: () => context.pop(),
              width: double.infinity,
              child: Text('Add ₹$amount'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
