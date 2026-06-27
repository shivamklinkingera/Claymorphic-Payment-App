import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/data/database.dart';

class SendMoneyAmountPage extends StatefulWidget {
  final Contact contact;
  const SendMoneyAmountPage({super.key, required this.contact});

  @override
  State<SendMoneyAmountPage> createState() => _SendMoneyAmountPageState();
}

class _SendMoneyAmountPageState extends State<SendMoneyAmountPage> {
  String _amount = "0";

  void _onKeyPress(String value) {
    setState(() {
      if (_amount == "0") {
        _amount = value;
      } else {
        _amount += value;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (_amount.length > 1) {
        _amount = _amount.substring(0, _amount.length - 1);
      } else {
        _amount = "0";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClayContainer(
            borderRadius: 999,
            child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
          ),
        ),
        title: Text(widget.contact.name),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          ClayContainer(
            width: 80, height: 80, borderRadius: 40, elevation: ClayElevation.level2,
            child: ClipRRect(borderRadius: BorderRadius.circular(40), child: Image.network(widget.contact.avatarUrl ?? '', fit: BoxFit.cover, errorBuilder: (c,e,s) => const Icon(Icons.person))),
          ),
          const SizedBox(height: 16),
          Text(widget.contact.upiId, style: const TextStyle(color: ClayColors.onSurfaceVariant)),
          const SizedBox(height: 48),
          Text('₹$_amount', style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w800, color: ClayColors.primary)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildKeypad(),
                const SizedBox(height: 32),
                ClayButton(
                  onPressed: _amount == "0" ? null : () => context.push('/send-money/confirm', extra: {'contact': widget.contact, 'amount': double.parse(_amount)}),
                  width: double.infinity,
                  child: const Text('Proceed to Pay'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypad() {
    return GridView.builder(
      shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.5),
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index == 9) return _KeypadButton(label: '.', onTap: () => _onKeyPress('.'));
        if (index == 10) return _KeypadButton(label: '0', onTap: () => _onKeyPress('0'));
        if (index == 11) return _KeypadButton(icon: Icons.backspace, onTap: _onBackspace);
        return _KeypadButton(label: '${index + 1}', onTap: () => _onKeyPress('${index + 1}'));
      },
    );
  }
}

class _KeypadButton extends StatelessWidget {
  final String? label; final IconData? icon; final VoidCallback onTap;
  const _KeypadButton({this.label, this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) => ClayButton(onPressed: onTap, padding: EdgeInsets.zero, color: ClayColors.surface, borderRadius: 999, child: Center(child: label != null ? Text(label!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ClayColors.primary)) : Icon(icon, color: ClayColors.primary)));
}
