import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class BillPaymentsHubPage extends StatelessWidget {
  const BillPaymentsHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bills & Recharges'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ClayTextField(hintText: 'Search billers', prefixIcon: Icons.search),
            const SizedBox(height: 32),
            _Section(
              title: 'Utilities',
              items: [
                _ServiceTile(icon: Icons.phone_android, label: 'Mobile', onTap: () => context.push('/mobile-recharge')),
                _ServiceTile(icon: Icons.lightbulb_outline, label: 'Electricity', onTap: () => context.push('/electricity-bill')),
                _ServiceTile(icon: Icons.tv, label: 'DTH', onTap: () => context.push('/dth-recharge')),
                _ServiceTile(icon: Icons.local_fire_department, label: 'Gas', onTap: () => context.push('/gas-bill')),
                _ServiceTile(icon: Icons.water_drop_outlined, label: 'Water', onTap: () {}),
                _ServiceTile(icon: Icons.wifi, label: 'Broadband', onTap: () {}),
                _ServiceTile(icon: Icons.home_repair_service_outlined, label: 'Insurance', onTap: () {}),
                _ServiceTile(icon: Icons.credit_card, label: 'Credit Card', onTap: () {}),
              ],
            ),
            const SizedBox(height: 32),
            _Section(
              title: 'Recent Bills',
              items: [
                _RecentBillTile(label: 'Airtel Mobile', amount: 499, date: 'Paid 2 days ago'),
                _RecentBillTile(label: 'Tata Power', amount: 1240, date: 'Due in 5 days', isDue: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> items;
  const _Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        if (items.first is _ServiceTile)
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            children: items,
          )
        else
          Column(children: items),
      ],
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ServiceTile({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClayContainer(
            width: 56,
            height: 56,
            borderRadius: 16,
            child: Icon(icon, color: ClayColors.primary),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _RecentBillTile extends StatelessWidget {
  final String label;
  final double amount;
  final String date;
  final bool isDue;
  const _RecentBillTile({required this.label, required this.amount, required this.date, this.isDue = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClayContainer(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClayContainer(
              width: 48,
              height: 48,
              borderRadius: 24,
              child: Icon(Icons.receipt_long, color: isDue ? ClayColors.error : ClayColors.secondary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(date, style: TextStyle(fontSize: 12, color: isDue ? ClayColors.error : ClayColors.onSurfaceVariant)),
                ],
              ),
            ),
            Text('₹$amount', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
