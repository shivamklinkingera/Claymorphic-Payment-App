import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class WealthInvestmentsPage extends StatelessWidget {
  const WealthInvestmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wealth & Investments'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClayContainer(
              padding: const EdgeInsets.all(24),
              color: ClayColors.primary,
              child: Column(
                children: [
                  const Text('Total Wealth', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  const Text('₹4,25,000', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.trending_up, color: ClayColors.secondaryContainer, size: 20),
                      const SizedBox(width: 4),
                      Text('+₹12,450 (14.2%)', style: TextStyle(color: ClayColors.secondaryContainer, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _InvestmentCategory(
              icon: Icons.show_chart,
              label: 'Mutual Funds',
              value: '₹2,80,000',
              onTap: () => context.push('/mutual-funds'),
            ),
            const SizedBox(height: 16),
            _InvestmentCategory(
              icon: Icons.account_balance,
              label: 'Fixed Deposits',
              value: '₹1,45,000',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _InvestmentCategory(
              icon: Icons.currency_rupee,
              label: 'Digital Gold',
              value: '₹0',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _InvestmentCategory extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  const _InvestmentCategory({required this.icon, required this.label, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            ClayContainer(width: 48, height: 48, borderRadius: 24, child: Icon(icon, color: ClayColors.primary)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(value, style: const TextStyle(color: ClayColors.onSurfaceVariant)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: ClayColors.outlineVariant),
          ],
        ),
      ),
    );
  }
}
