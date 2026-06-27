import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class OffersRewardsHubPage extends StatelessWidget {
  const OffersRewardsHubPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offers & Rewards')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          Row(children: [
            _stat(context, 'Cashback', '₹1,240', '/my-earnings'),
            const SizedBox(width: 16),
            _stat(context, 'Coupons', '12', '/my-coupons'),
          ]),
          const SizedBox(height: 32),
          const Text('Top Offers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          _offer('Zomato', 'Flat 50% OFF', Colors.orange[100]!),
          _offer('Amazon', '10% Cashback', Colors.yellow[100]!),
          const SizedBox(height: 32),
          ClayContainer(
            color: ClayColors.primary, borderRadius: 20, padding: const EdgeInsets.all(20),
            child: Row(children: [
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Refer & Earn', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('Get ₹100 for each friend', style: TextStyle(color: Colors.white70, fontSize: 12))])),
              ClayButton(onPressed: () => context.push('/refer-earn'), color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: const Text('Invite', style: TextStyle(color: ClayColors.primary, fontSize: 12))),
            ]),
          )
        ]),
      ),
    );
  }
  Widget _stat(BuildContext context, String l, String v, String r) => Expanded(child: ClayContainer(borderRadius: 16, padding: const EdgeInsets.all(16), child: InkWell(onTap: () => context.push(r), child: Column(children: [Text(l, style: const TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant)), const SizedBox(height: 4), Text(v, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))]))));
  Widget _offer(String b, String o, Color c) => Padding(padding: const EdgeInsets.only(bottom: 16), child: ClayContainer(borderRadius: 16, color: c, padding: const EdgeInsets.all(16), child: Row(children: [const Icon(Icons.local_offer), const SizedBox(width: 16), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(b, style: const TextStyle(fontWeight: FontWeight.bold)), Text(o, style: const TextStyle(fontSize: 12))])])));
}
