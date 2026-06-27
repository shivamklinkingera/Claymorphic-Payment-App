import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class ChangeUpiPinPage extends StatefulWidget {
  const ChangeUpiPinPage({super.key});

  @override
  State<ChangeUpiPinPage> createState() => _ChangeUpiPinPageState();
}

class _ChangeUpiPinPageState extends State<ChangeUpiPinPage> {
  int step = 1; // 1: Old PIN, 2: New PIN, 3: Confirm PIN

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change UPI PIN'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClayContainer(
            borderRadius: 999,
            elevation: ClayElevation.level1,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: ClayColors.primary),
              onPressed: () => context.pop(),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          // Step Indicator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                _StepIndicator(label: 'Old PIN', status: step > 1 ? _StepStatus.completed : _StepStatus.active),
                _ProgressLine(active: step > 1),
                _StepIndicator(label: 'New PIN', status: step == 2 ? _StepStatus.active : (step > 2 ? _StepStatus.completed : _StepStatus.upcoming)),
                _ProgressLine(active: step > 2),
                _StepIndicator(label: 'Confirm', status: step == 3 ? _StepStatus.active : _StepStatus.upcoming),
              ],
            ),
          ),
          const Spacer(),
          Text(
            step == 1 ? 'Enter old UPI PIN' : (step == 2 ? 'Enter new UPI PIN' : 'Confirm new UPI PIN'),
            style: const TextStyle(fontSize: 18, color: ClayColors.onSurfaceVariant),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClayContainer(
                width: 16,
                height: 16,
                borderRadius: 8,
                isSunken: true,
              ),
            )),
          ),
          const Spacer(),
          _NumericKeypad(
            onPress: (val) {
              if (val == 'check') {
                if (step < 3) {
                  setState(() => step++);
                } else {
                  context.pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('UPI PIN changed successfully')));
                }
              }
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

enum _StepStatus { completed, active, upcoming }

class _StepIndicator extends StatelessWidget {
  final String label;
  final _StepStatus status;
  const _StepIndicator({required this.label, required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (status == _StepStatus.completed)
          const Icon(Icons.check_circle, color: ClayColors.primary, size: 24)
        else if (status == _StepStatus.active)
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ClayColors.primary, width: 4), color: ClayColors.primaryContainer),
            child: Center(child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: ClayColors.primary, shape: BoxShape.circle))),
          )
        else
          Container(width: 24, height: 24, decoration: const BoxDecoration(color: ClayColors.outlineVariant, shape: BoxShape.circle)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, color: status == _StepStatus.upcoming ? ClayColors.outlineVariant : ClayColors.primary, fontWeight: status == _StepStatus.active ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}

class _ProgressLine extends StatelessWidget {
  final bool active;
  const _ProgressLine({required this.active});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(height: 4, margin: const EdgeInsets.symmetric(horizontal: 8), decoration: BoxDecoration(color: active ? ClayColors.primary : ClayColors.outlineVariant, borderRadius: BorderRadius.circular(2))));
  }
}

class _NumericKeypad extends StatelessWidget {
  final Function(String) onPress;
  const _NumericKeypad({required this.onPress});

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
          for (var i = 1; i <= 9; i++) _KeyButton(i.toString(), () => onPress(i.toString())),
          _KeyButton('back', () => onPress('back'), icon: Icons.backspace),
          _KeyButton('0', () => onPress('0')),
          _KeyButton('check', () => onPress('check'), icon: Icons.check, color: ClayColors.primary),
        ],
      ),
    );
  }
}

class _KeyButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;
  const _KeyButton(this.label, this.onTap, {this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        borderRadius: 999,
        color: color ?? ClayColors.surface,
        child: Center(
          child: icon != null
            ? Icon(icon, color: color != null ? Colors.white : ClayColors.primary)
            : Text(label, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ClayColors.primary)),
        ),
      ),
    );
  }
}
