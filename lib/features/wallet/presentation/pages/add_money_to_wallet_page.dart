import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_button.dart';

class AddMoneyToWalletPage extends StatelessWidget {

  const AddMoneyToWalletPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('AddMoneyToWallet')),
    body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('This is the add_money_to_wallet page'),
      const SizedBox(height: 20),
      ClayButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Go Back'))
    ])),
  );
}
