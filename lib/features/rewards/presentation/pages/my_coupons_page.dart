import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class MyCouponsPage extends StatelessWidget {
  const MyCouponsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Coupons')),
      body: ListView(padding: const EdgeInsets.all(24), children: [
        _coupon('Flat ₹100 Off', 'Recharge', const Color(0xFFD1E4FF)),
        _coupon('50% Off', 'Food', const Color(0xFFFFDDAF)),
      ]),
    );
  }
  Widget _coupon(String t, String c, Color col) => Padding(padding: const EdgeInsets.only(bottom: 16), child: ClayContainer(borderRadius: 16, padding: const EdgeInsets.all(16), child: Row(children: [ClayContainer(width: 44, height: 44, borderRadius: 8, color: col, child: const Icon(Icons.confirmation_number)), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: const TextStyle(fontWeight: FontWeight.bold)), Text(c, style: const TextStyle(fontSize: 12))])), const Text('Copy', style: TextStyle(color: ClayColors.primary, fontWeight: FontWeight.bold))])));
}
