import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class GroupDetailsPage extends StatelessWidget {
  final String groupName;
  const GroupDetailsPage({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(groupName), backgroundColor: Colors.transparent),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Align(alignment: Alignment.centerLeft, child: Text('Members', style: TextStyle(fontWeight: FontWeight.bold))),
          const SizedBox(height: 16),
          _MemberTile('Rahul (You)', '₹0'),
          _MemberTile('Priya Sharma', '+₹500'),
          _MemberTile('Amit Shah', '-₹200'),
          const SizedBox(height: 32),
          const Align(alignment: Alignment.centerLeft, child: Text('Recent Expenses', style: TextStyle(fontWeight: FontWeight.bold))),
          const SizedBox(height: 16),
          _ExpenseTile('Dinner at Taj', '₹2,500', 'Paid by Rahul'),
          _ExpenseTile('Movie Tickets', '₹1,200', 'Paid by Priya'),
        ],
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  final String name;
  final String balance;
  const _MemberTile(this.name, this.balance);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClayContainer(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClayContainer(width: 32, height: 32, borderRadius: 16, child: const Icon(Icons.person, size: 16)),
            const SizedBox(width: 12),
            Expanded(child: Text(name)),
            Text(balance, style: TextStyle(color: balance.contains('+') ? ClayColors.secondary : (balance.contains('-') ? ClayColors.error : null), fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _ExpenseTile extends StatelessWidget {
  final String title;
  final String amount;
  final String payer;
  const _ExpenseTile(this.title, this.amount, this.payer);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClayContainer(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.receipt_long, color: ClayColors.outlineVariant),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(payer, style: const TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant)),
                ],
              ),
            ),
            Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
