import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/data/database.dart';
import '../../../../core/services/providers.dart';

class ConfirmPaymentUpiPinPage extends ConsumerStatefulWidget {
  final Contact contact;
  final double amount;
  const ConfirmPaymentUpiPinPage({super.key, required this.contact, required this.amount});

  @override
  ConsumerState<ConfirmPaymentUpiPinPage> createState() => _ConfirmPaymentUpiPinPageState();
}

class _ConfirmPaymentUpiPinPageState extends ConsumerState<ConfirmPaymentUpiPinPage> {
  String pin = "";

  void _onTap(String val) async {
    if (pin.length < 4) {
      setState(() => pin += val);
      if (pin.length == 4) {
        final user = ref.read(currentUserProvider);
        if (user == null) return;

        final success = await ref.read(transactionServiceProvider).sendMoney(
          senderId: user.id,
          receiverId: widget.contact.id,
          senderName: user.name,
          receiverName: widget.contact.name,
          amount: widget.amount,
        );

        if (success) {
          ref.invalidate(userAccountsProvider);
          ref.invalidate(userTransactionsProvider);
          if (mounted) {
            context.pushReplacement('/success', extra: {
              'contact': widget.contact,
              'amount': widget.amount,
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter UPI PIN'), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Text('Paying ₹${widget.amount}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('to ${widget.contact.name}', style: const TextStyle(color: ClayColors.onSurfaceVariant)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClayContainer(width: 20, height: 20, borderRadius: 10, isSunken: pin.length <= i, color: pin.length > i ? ClayColors.primary : null),
            )),
          ),
          const Spacer(),
          _NumericKeypad(onTap: _onTap),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _NumericKeypad extends StatelessWidget {
  final Function(String) onTap;
  const _NumericKeypad({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          for (var i = 1; i <= 9; i++) _Key(i.toString(), onTap),
          const SizedBox.shrink(),
          _Key('0', onTap),
          const Icon(Icons.check_circle, color: ClayColors.primary, size: 48),
        ],
      ),
    );
  }
}

class _Key extends StatelessWidget {
  final String label;
  final Function(String) onTap;
  const _Key(this.label, this.onTap);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(label),
      child: ClayContainer(borderRadius: 999, child: Center(child: Text(label, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ClayColors.primary)))),
    );
  }
}
