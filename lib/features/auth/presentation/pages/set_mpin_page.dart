import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/services/providers.dart';

class SetMpinPage extends ConsumerStatefulWidget {
  const SetMpinPage({super.key});

  @override
  ConsumerState<SetMpinPage> createState() => _SetMpinPageState();
}

class _SetMpinPageState extends ConsumerState<SetMpinPage> {
  String pin = "";

  void _onKeyTap(String val) async {
    if (pin.length < 4) {
      setState(() => pin += val);
      if (pin.length == 4) {
        final security = ref.read(securityServiceProvider);
        await security.saveMPIN(pin);

        final user = ref.read(currentUserProvider);
        if (user != null) {
          await ref.read(userRepositoryProvider).updateMPIN(user.id, pin);
        }

        if (mounted) context.go('/');
      }
    }
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
            child: ClayContainer(width: 96, height: 96, borderRadius: 48, child: const Icon(Icons.fingerprint, size: 48, color: ClayColors.primary)),
          ),
          const SizedBox(height: 32),
          Text('Set your MPIN', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          const Text('Used to authorize payments', style: TextStyle(color: ClayColors.onSurfaceVariant)),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClayContainer(width: 16, height: 16, borderRadius: 8, isSunken: pin.length <= i, color: pin.length > i ? ClayColors.primaryContainer : null),
            )),
          ),
          const Spacer(),
          _Keypad(onTap: _onKeyTap),
          const SizedBox(height: 40),
          TextButton.icon(onPressed: () {}, icon: const Icon(Icons.fingerprint, size: 20), label: const Text('Use biometric instead')),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Keypad extends StatelessWidget {
  final Function(String) onTap;
  const _Keypad({required this.onTap});

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
          for (var i = 1; i <= 9; i++) _KeyButton(i.toString(), () => onTap(i.toString())),
          const SizedBox.shrink(),
          _KeyButton('0', () => onTap('0')),
          const Icon(Icons.backspace_outlined, color: ClayColors.primary, size: 32),
        ],
      ),
    );
  }
}

class _KeyButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _KeyButton(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(borderRadius: 999, child: Center(child: Text(label, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ClayColors.primary)))),
    );
  }
}
