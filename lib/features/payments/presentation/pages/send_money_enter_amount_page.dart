import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/data/database.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class SendMoneyAmountPage extends StatefulWidget {
  final Contact contact;
  const SendMoneyAmountPage({super.key, required this.contact});

  @override
  State<SendMoneyAmountPage> createState() => _SendMoneyAmountPageState();
}

class _SendMoneyAmountPageState extends State<SendMoneyAmountPage> {
  final TextEditingController _amountController = TextEditingController(text: '0');

  void _onKeyTap(String val) {
    setState(() {
      if (_amountController.text == '0') {
        _amountController.text = val;
      } else {
        _amountController.text += val;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (_amountController.text.length > 1) {
        _amountController.text = _amountController.text.substring(0, _amountController.text.length - 1);
      } else {
        _amountController.text = '0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _ContactHeader(contact: widget.contact),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('₹', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: ClayColors.primary)),
              const SizedBox(width: 8),
              Text(_amountController.text, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 8),
          const ClayContainer(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            borderRadius: 12,
            isSunken: true,
            child: Text('Add a note', style: TextStyle(color: ClayColors.onSurfaceVariant)),
          ),
          const Spacer(),
          _CustomKeypad(onTap: _onKeyTap, onBackspace: _onBackspace),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ClayButton(
              onPressed: () => context.push('/confirm', extra: {
                'contact': widget.contact,
                'amount': double.parse(_amountController.text),
              }),
              width: double.infinity,
              child: Text('Pay ₹${_amountController.text}'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactHeader extends StatelessWidget {
  final Contact contact;
  const _ContactHeader({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClayContainer(
          width: 80,
          height: 80,
          borderRadius: 40,
          child: const Icon(Icons.person, size: 40, color: ClayColors.primary),
        ),
        const SizedBox(height: 12),
        Text(contact.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(contact.upiId, style: const TextStyle(color: ClayColors.onSurfaceVariant)),
      ],
    );
  }
}

class _CustomKeypad extends StatelessWidget {
  final Function(String) onTap;
  final VoidCallback onBackspace;
  const _CustomKeypad({required this.onTap, required this.onBackspace});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      children: [
        for (var i = 1; i <= 9; i++) _Key(i.toString(), () => onTap(i.toString())),
        _Key('.', () => onTap('.')),
        _Key('0', () => onTap('0')),
        _Key('back', onBackspace, icon: Icons.backspace),
      ],
    );
  }
}

class _Key extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  const _Key(this.label, this.onTap, {this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: icon != null
          ? Icon(icon, color: ClayColors.onSurfaceVariant)
          : Text(label, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
