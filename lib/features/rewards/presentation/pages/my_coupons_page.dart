import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_container.dart';

class MyCouponsPage extends StatelessWidget {
  const MyCouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Coupons'), backgroundColor: Colors.transparent),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ClayContainer(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Icon(Icons.card_giftcard, size: 40),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Zomato Flat ₹120 Off', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Valid till 30 June', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Redeem')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
