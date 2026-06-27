import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class OffersRewardsHubPage extends StatelessWidget {
  const OffersRewardsHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            ClayContainer(
              padding: const EdgeInsets.all(24),
              color: ClayColors.accent,
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cashback Earned', style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 4),
                        Text('₹1,240', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Icon(Icons.workspace_premium, color: Colors.white, size: 48),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _RewardAction(icon: Icons.confirmation_number_outlined, label: 'My Coupons', onTap: () => context.push('/my-coupons')),
                _RewardAction(icon: Icons.account_balance_wallet_outlined, label: 'Earnings', onTap: () => context.push('/my-earnings')),
                _RewardAction(icon: Icons.person_add_outlined, label: 'Refer & Earn', onTap: () => context.push('/refer-earn')),
              ],
            ),
            const SizedBox(height: 32),
            const Align(alignment: Alignment.centerLeft, child: Text('Exclusive Offers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 16),
            _OfferCard(title: 'Get 50% Off on Swiggy', description: 'On orders above ₹400', code: 'CLAY50'),
            _OfferCard(title: 'Flat ₹100 Cashback', description: 'On first electricity bill payment', code: 'BILL100'),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _RewardAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _RewardAction({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClayContainer(width: 64, height: 64, borderRadius: 20, child: Icon(icon, color: ClayColors.primary)),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  const _OfferCard({required this.title, required this.description, required this.code});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClayContainer(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(description, style: const TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 13)),
            const SizedBox(height: 16),
            ClayContainer(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              isSunken: true,
              child: Text(code, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, color: ClayColors.primary)),
            ),
          ],
        ),
      ),
    );
  }
}
