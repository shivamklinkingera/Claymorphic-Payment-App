import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class ReferEarnPage extends StatelessWidget {
  const ReferEarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Refer & Earn'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ClayContainer(
              padding: const EdgeInsets.all(32),
              child: const Icon(Icons.people_alt_outlined, size: 100, color: ClayColors.primary),
            ),
            const SizedBox(height: 32),
            const Text('Invite friends to PayClay', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text(
              'Earn ₹101 cashback when your friend makes their first payment on PayClay',
              textAlign: TextAlign.center,
              style: TextStyle(color: ClayColors.onSurfaceVariant),
            ),
            const Spacer(),
            ClayContainer(
              padding: const EdgeInsets.all(16),
              isSunken: true,
              child: const Row(
                children: [
                  Text('PAYCLAY101', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
                  Spacer(),
                  Icon(Icons.copy, size: 18),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ClayButton(onPressed: () {}, width: double.infinity, child: const Text('Invite Friends')),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
