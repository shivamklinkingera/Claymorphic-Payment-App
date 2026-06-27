import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class ReferEarnPage extends StatelessWidget {
  const ReferEarnPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Refer & Earn')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          const ClayContainer(width: 120, height: 120, borderRadius: 60, child: Icon(Icons.card_giftcard, size: 64)),
          const SizedBox(height: 32),
          const Text('Invite friends to PayClay', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('Earn ₹100 for each friend you refer!', textAlign: TextAlign.center),
          const Spacer(),
          const Text('Your Code', style: TextStyle(fontSize: 12)),
          const SizedBox(height: 8),
          const ClayContainer(isSunken: true, padding: EdgeInsets.all(16), child: Text('PAYCLAY100', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2))),
          const Spacer(),
          ClayButton(onPressed: () {}, width: double.infinity, child: const Text('Invite Now')),
        ]),
      ),
    );
  }
}
