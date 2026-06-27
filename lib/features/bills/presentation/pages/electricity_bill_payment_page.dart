import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/services/providers.dart';

class ElectricityBillPaymentPage extends ConsumerWidget {
  const ElectricityBillPaymentPage({super.key});

  void _payBill(WidgetRef ref, BuildContext context) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    await ref.read(transactionServiceProvider).sendMoney(
      senderId: user.id,
      receiverId: null,
      senderName: user.name,
      receiverName: 'Tata Power',
      amount: 1240.0,
      description: 'Electricity Bill',
    );
    ref.invalidate(userAccountsProvider);
    ref.invalidate(userTransactionsProvider);
    if (context.mounted) {
      context.push('/bill-success', extra: {'billerName': 'Tata Power', 'amount': 1240.0});
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Electricity Bill'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ClayContainer(padding: EdgeInsets.all(20), child: Column(children: [Text('Select Provider', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 16), ClayContainer(isSunken: true, padding: EdgeInsets.all(16), child: Row(children: [Icon(Icons.business, color: ClayColors.primary), SizedBox(width: 16), Text('Tata Power - Mumbai'), Spacer(), Icon(Icons.keyboard_arrow_down)]))])),
            const SizedBox(height: 32),
            const ClayTextField(hintText: 'Consumer Number', prefixIcon: Icons.person_outline),
            const SizedBox(height: 48),
            ClayButton(onPressed: () => _payBill(ref, context), width: double.infinity, child: const Text('Proceed to Pay')),
          ],
        ),
      ),
    );
  }
}
