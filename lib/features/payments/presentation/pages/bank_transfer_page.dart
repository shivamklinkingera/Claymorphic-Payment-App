import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class BankTransferPage extends StatefulWidget {
  const BankTransferPage({super.key});

  @override
  State<BankTransferPage> createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bank Transfer'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClayContainer(
              padding: const EdgeInsets.all(4),
              borderRadius: 12,
              child: Row(
                children: [
                  Expanded(child: _Tab(label: 'IMPS', active: tabIndex == 0, onTap: () => setState(() => tabIndex = 0))),
                  Expanded(child: _Tab(label: 'NEFT', active: tabIndex == 1, onTap: () => setState(() => tabIndex = 1))),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const _Label('Recipient Details'),
            const SizedBox(height: 16),
            const ClayTextField(hintText: 'Account Number'),
            const SizedBox(height: 16),
            const ClayTextField(hintText: 'Confirm Account Number'),
            const SizedBox(height: 16),
            const ClayTextField(hintText: 'IFSC Code'),
            const SizedBox(height: 32),
            const _Label('Amount'),
            const SizedBox(height: 16),
            const ClayTextField(hintText: '₹ 0.00', keyboardType: TextInputType.number),
            const SizedBox(height: 48),
            ClayButton(
              onPressed: () => context.pop(),
              width: double.infinity,
              child: const Text('Transfer Money'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _Tab({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: active ? ClayColors.primary : Colors.transparent,
        elevation: active ? ClayElevation.level1 : ClayElevation.level1,
        isSunken: !active,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: active ? Colors.white : ClayColors.onSurfaceVariant, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String label;
  const _Label(this.label);
  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)));
  }
}
