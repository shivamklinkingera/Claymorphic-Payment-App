import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class MutualFundsPage extends StatelessWidget {
  const MutualFundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mutual Funds'), backgroundColor: Colors.transparent),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Top Performing Funds', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _FundCard(name: 'ICICI Prudential Bluechip Fund', returns: '18.4%', risk: 'Very High'),
          _FundCard(name: 'HDFC Index Fund S&P BSE Sensex', returns: '15.2%', risk: 'High'),
          _FundCard(name: 'SBI Small Cap Fund', returns: '24.1%', risk: 'Very High'),
        ],
      ),
    );
  }
}

class _FundCard extends StatelessWidget {
  final String name;
  final String returns;
  final String risk;
  const _FundCard({required this.name, required this.returns, required this.risk});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () => context.push('/fund-details', extra: name),
        child: ClayContainer(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('3Y Returns', style: TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant)),
                      Text(returns, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ClayColors.secondary)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Risk', style: TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant)),
                      Text(risk, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
