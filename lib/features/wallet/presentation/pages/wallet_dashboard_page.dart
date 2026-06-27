import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class WalletDashboardPage extends StatelessWidget {
  const WalletDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Wallet'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClayContainer(
              padding: const EdgeInsets.all(24),
              elevation: ClayElevation.level2,
              child: Column(
                children: [
                  const Text('Wallet Balance', style: TextStyle(color: ClayColors.onSurfaceVariant)),
                  const SizedBox(height: 8),
                  const Text('₹2,450.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 24),
                  ClayButton(
                    onPressed: () => context.push('/add-money'),
                    width: double.infinity,
                    child: const Text('Add Money to Wallet'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Row(
              children: [
                Text('Wallet Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ClayContainer(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.add_circle_outline, color: ClayColors.secondary),
                      const SizedBox(width: 16),
                      const Expanded(child: Text('Added to Wallet', style: TextStyle(fontWeight: FontWeight.bold))),
                      Text('+₹500', style: TextStyle(fontWeight: FontWeight.bold, color: ClayColors.secondary)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
