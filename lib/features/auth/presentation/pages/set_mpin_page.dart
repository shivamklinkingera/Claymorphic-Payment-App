import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class SetMpinPage extends StatefulWidget {
  const SetMpinPage({super.key});

  @override
  State<SetMpinPage> createState() => _SetMpinPageState();
}

class _SetMpinPageState extends State<SetMpinPage> {
  String _pin = "";

  void _onKeyPress(String value) {
    if (_pin.length < 4) {
      setState(() {
        _pin += value;
      });
      if (_pin.length == 4) {
        context.go('/');
      }
    }
  }

  void _onBackspace() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
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
              onPressed: () => context.go('/otp_verification'),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const ClayContainer(
            width: 96,
            height: 96,
            borderRadius: 48,
            elevation: ClayElevation.level2,
            child: Icon(Icons.fingerprint, size: 48, color: ClayColors.primary),
          ),
          const SizedBox(height: 24),
          Text(
            'Set your MPIN',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ClayColors.onSurface,
                ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Used to authorize payments',
            style: TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 14),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              bool isFilled = index < _pin.length;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: ClayContainer(
                  width: 24,
                  height: 24,
                  borderRadius: 12,
                  isSunken: !isFilled,
                  color: isFilled ? ClayColors.primaryContainer : ClayColors.surface,
                ),
              );
            }),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildKeypad(),
                const SizedBox(height: 32),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.fingerprint, color: ClayColors.primary),
                  label: const Text('Use biometric instead', style: TextStyle(color: ClayColors.primary, fontWeight: FontWeight.bold)),
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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.2,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index == 9) return const SizedBox();
        if (index == 10) return _KeypadButton(label: '0', onTap: () => _onKeyPress('0'));
        if (index == 11) return _KeypadButton(icon: Icons.backspace, onTap: _onBackspace);
        return _KeypadButton(label: '${index + 1}', onTap: () => _onKeyPress('${index + 1}'));
      },
    );
  }
}

class _KeypadButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback onTap;

  const _KeypadButton({this.label, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClayButton(
      onPressed: onTap,
      padding: EdgeInsets.all(8),
      color: ClayColors.surface,
      borderRadius: 999,
      child: Center(
        child: label != null
            ? Text(label!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ClayColors.primary))
            : Icon(icon, color: ClayColors.primary),
      ),
    );
  }
}
