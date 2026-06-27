import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
class LinkedBankAccountsPage extends StatelessWidget {
  const LinkedBankAccountsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Linked Banks')),
      body: ListView(padding: const EdgeInsets.all(24), children: [
        ClayContainer(borderRadius: 20, padding: const EdgeInsets.all(20), child: const Row(children: [Icon(Icons.account_balance, color: ClayColors.primary), SizedBox(width: 16), Text('State Bank of India', style: TextStyle(fontWeight: FontWeight.bold))])),
      ]),
    );
  }
}
