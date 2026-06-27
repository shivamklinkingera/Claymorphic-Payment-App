import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/services/providers.dart';

class AddMoneyToWalletPage extends ConsumerStatefulWidget {
  const AddMoneyToWalletPage({super.key});

  @override
  ConsumerState<AddMoneyToWalletPage> createState() => _AddMoneyToWalletPageState();
}

class _AddMoneyToWalletPageState extends ConsumerState<AddMoneyToWalletPage> {
  String amountStr = "1000";

  void _addMoney() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final amount = double.tryParse(amountStr) ?? 0;
    await ref.read(transactionServiceProvider).addMoneyToWallet(user.id, amount);
    ref.invalidate(userAccountsProvider);
    ref.invalidate(userTransactionsProvider);
    if (mounted) context.pop();
  }

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
            Text('₹$amountStr', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: ClayColors.primary)),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['500', '1000', '2000'].map((e) => GestureDetector(
                onTap: () => setState(() => amountStr = e),
                child: ClayContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: amountStr == e ? ClayColors.primary : Colors.white,
                  child: Text('₹$e', style: TextStyle(color: amountStr == e ? Colors.white : ClayColors.onSurface, fontWeight: FontWeight.bold)),
                ),
              )).toList(),
            ),
            const Spacer(),
            const Align(alignment: Alignment.centerLeft, child: Text('Select Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 16),
            const ClayContainer(padding: EdgeInsets.all(16), child: Row(children: [Icon(Icons.account_balance, color: ClayColors.primary), SizedBox(width: 16), Text('SBI Account •••• 4521', style: TextStyle(fontWeight: FontWeight.bold)), Spacer(), Icon(Icons.check_circle, color: ClayColors.primary)])),
            const SizedBox(height: 32),
            ClayButton(onPressed: _addMoney, width: double.infinity, child: Text('Add ₹$amountStr')),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
