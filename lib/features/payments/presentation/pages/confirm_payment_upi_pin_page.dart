import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' hide Column;
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/data/database.dart';
import '../../../../core/services/providers.dart';

class ConfirmPaymentUpiPinPage extends ConsumerStatefulWidget {
  final Contact contact; final double amount;
  const ConfirmPaymentUpiPinPage({super.key, required this.contact, required this.amount});
  @override
  ConsumerState<ConfirmPaymentUpiPinPage> createState() => _ConfirmPaymentUpiPinPageState();
}

class _ConfirmPaymentUpiPinPageState extends ConsumerState<ConfirmPaymentUpiPinPage> {
  String _pin = "";
  void _onKeyPress(String value) { if (_pin.length < 4) { setState(() => _pin += value); if (_pin.length == 4) _process(); } }
  void _onBackspace() { if (_pin.isNotEmpty) setState(() => _pin = _pin.substring(0, _pin.length - 1)); }

  void _process() async {
    final user = ref.read(currentUserProvider); if (user == null) return;
    showDialog(context: context, barrierDismissible: false, builder: (c) => const Center(child: CircularProgressIndicator()));
    await Future.delayed(const Duration(seconds: 2));
    final bankRepo = ref.read(bankRepositoryProvider);
    final transRepo = ref.read(transactionRepositoryProvider);
    final accounts = await bankRepo.getAccountsForUser(user.id);
    final primary = accounts.first;
    await bankRepo.updateBalance(primary.id, primary.balance - widget.amount);
    await transRepo.createTransaction(TransactionsCompanion.insert(senderId: Value(user.id), senderName: user.name, receiverName: widget.contact.name, amount: widget.amount, status: 'success', type: 'transfer', referenceId: 'REF${DateTime.now().millisecondsSinceEpoch}'));
    ref.invalidate(userTransactionsProvider); ref.invalidate(userAccountsProvider);
    if (mounted) { Navigator.pop(context); context.go('/send-money/success', extra: {'contact': widget.contact, 'amount': widget.amount}); }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ClayColors.background,
      body: Column(
        children: [
          const SizedBox(height: 64),
          const Text('Confirm Payment', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ClayContainer(
              borderRadius: 24, padding: const EdgeInsets.all(24),
              child: Column(children: [
                const Text('Sending to', style: TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 12)),
                const SizedBox(height: 12),
                Text(widget.contact.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('₹${widget.amount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: ClayColors.primary)),
              ]),
            ),
          ),
          const Spacer(),
          const Text('Enter 4-digit UPI PIN', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(4, (i) => Container(margin: const EdgeInsets.symmetric(horizontal: 12), child: ClayContainer(width: 20, height: 20, borderRadius: 10, isSunken: i >= _pin.length, color: i < _pin.length ? ClayColors.primary : ClayColors.surface)))),
          const SizedBox(height: 48),
          _Keypad(onKeyPress: _onKeyPress, onBackspace: _onBackspace),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _Keypad extends StatelessWidget {
  final Function(String) onKeyPress; final VoidCallback onBackspace;
  const _Keypad({required this.onKeyPress, required this.onBackspace});
  @override
  Widget build(BuildContext context) => GridView.count(shrinkWrap: true, crossAxisCount: 3, childAspectRatio: 1.5, children: List.generate(9, (i) => _Key(label: '${i+1}', onTap: () => onKeyPress('${i+1}')))..addAll([const SizedBox(), _Key(label: '0', onTap: () => onKeyPress('0')), _Key(icon: Icons.backspace, onTap: onBackspace)]));
}

class _Key extends StatelessWidget {
  final String? label; final IconData? icon; final VoidCallback onTap;
  const _Key({this.label, this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) => IconButton(onPressed: onTap, icon: label != null ? Text(label!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)) : Icon(icon));
}
