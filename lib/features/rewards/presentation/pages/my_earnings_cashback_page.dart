import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class MyEarningsCashbackPage extends StatelessWidget {
  const MyEarningsCashbackPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Earnings')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: ClayContainer(width: double.infinity, color: ClayColors.secondaryContainer, borderRadius: 24, padding: const EdgeInsets.all(32), child: const Column(children: [Text('Total Cashback'), Text('₹1,240.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))])),
        ),
        const Expanded(child: Center(child: Text('No earning history yet'))),
      ]),
    );
  }
}
