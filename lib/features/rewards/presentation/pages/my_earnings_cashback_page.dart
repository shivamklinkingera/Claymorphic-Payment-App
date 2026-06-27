import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class MyEarningsCashbackPage extends StatelessWidget {
  const MyEarningsCashbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Earnings'), backgroundColor: Colors.transparent),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ClayContainer(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.account_balance_wallet_outlined, color: ClayColors.secondary),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cashback Received', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('For paying Electricity Bill', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                const Text('+₹50', style: TextStyle(fontWeight: FontWeight.bold, color: ClayColors.secondary)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
