import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SetMpinPage extends StatelessWidget {
  const SetMpinPage({super.key});

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
          const SizedBox(height: 20),
          Center(
            child: ClayContainer(
              width: 96,
              height: 96,
              borderRadius: 48,
              child: const Icon(Icons.fingerprint, size: 48, color: ClayColors.primary),
            ),
          ),
          const SizedBox(height: 32),
          Text('Set your MPIN', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          const Text('Used to authorize payments', style: TextStyle(color: ClayColors.onSurfaceVariant)),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _PinDot(filled: true),
              const SizedBox(width: 24),
              _PinDot(filled: true),
              const SizedBox(width: 24),
              _PinDot(filled: false),
              const SizedBox(width: 24),
              _PinDot(filled: false),
            ],
          ),
          const Spacer(),
          _Keypad(onComplete: () => context.go('/')),
          const SizedBox(height: 40),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.fingerprint, size: 20),
            label: const Text('Use biometric instead'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _PinDot extends StatelessWidget {
  final bool filled;
  const _PinDot({required this.filled});

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      width: 24,
      height: 24,
      borderRadius: 12,
      isSunken: !filled,
      color: filled ? ClayColors.primaryContainer : ClayColors.background,
    );
  }
}

class _Keypad extends StatelessWidget {
  final VoidCallback onComplete;
  const _Keypad({required this.onComplete});

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
          for (var i = 1; i <= 9; i++) _KeyButton(i.toString()),
          const SizedBox.shrink(),
          _KeyButton('0'),
          GestureDetector(
            onTap: onComplete,
            child: ClayContainer(
              borderRadius: 999,
              child: const Icon(Icons.backspace, color: ClayColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _KeyButton extends StatelessWidget {
  final String label;
  const _KeyButton(this.label);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      borderRadius: 999,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ClayColors.primary),
        ),
      ),
    );
  }
}
