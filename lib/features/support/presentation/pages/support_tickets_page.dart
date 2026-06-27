import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SupportTicketsPage extends StatelessWidget {
  const SupportTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tickets'), backgroundColor: Colors.transparent),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ClayContainer(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ticket #${10234 + index}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: index == 0 ? Colors.green : Colors.orange, borderRadius: BorderRadius.circular(4)),
                      child: Text(index == 0 ? 'Resolved' : 'Pending', style: const TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Transaction failed but amount deducted', style: TextStyle(fontSize: 13)),
                const SizedBox(height: 12),
                Text('Last updated: ${index == 0 ? "Yesterday" : "2h ago"}', style: const TextStyle(fontSize: 11, color: ClayColors.onSurfaceVariant)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
