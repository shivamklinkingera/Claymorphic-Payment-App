import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SplitBillsPage extends StatelessWidget {
  const SplitBillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Split Bills'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ClayContainer(
              padding: EdgeInsets.all(24),
              color: ClayColors.primary,
              child: Column(
                children: [
                  Text('Overall Balance', style: TextStyle(color: Colors.white70)),
                  Text('You are owed ₹4,890', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Align(alignment: Alignment.centerLeft, child: Text('Active Groups', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 16),
            _GroupCard(name: 'Roommates', status: 'You owe ₹1,120', statusColor: ClayColors.error, onTap: () => context.push('/group-details', extra: 'Roommates')),
            _GroupCard(name: 'Trip to Goa', status: 'You are owed ₹3,500', statusColor: ClayColors.secondary, onTap: () => context.push('/group-details', extra: 'Trip to Goa')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/split-new'),
        backgroundColor: ClayColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  final String name;
  final String status;
  final Color statusColor;
  final VoidCallback onTap;
  const _GroupCard({required this.name, required this.status, required this.statusColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: ClayContainer(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              const ClayContainer(width: 48, height: 48, borderRadius: 24, child: Icon(Icons.group, color: ClayColors.primary)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(status, style: TextStyle(color: statusColor, fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: ClayColors.outlineVariant),
            ],
          ),
        ),
      ),
    );
  }
}
