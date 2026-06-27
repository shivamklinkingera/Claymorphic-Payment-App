import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/services/providers.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(userTransactionsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), backgroundColor: Colors.transparent),
      body: transactionsAsync.when(
        data: (txs) => ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: txs.length,
          itemBuilder: (context, index) {
            final tx = txs[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ClayContainer(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClayContainer(width: 48, height: 48, borderRadius: 24, color: ClayColors.primaryContainer.withValues(alpha: 0.1), child: const Icon(Icons.notifications_outlined, color: ClayColors.primary)),
                    const SizedBox(width: 16),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(tx.type == 'DEBIT' ? 'Payment Sent' : 'Payment Received', style: const TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height: 4), Text('Transaction of ₹${tx.amount} ${tx.status.toLowerCase()}', style: const TextStyle(fontSize: 13, color: ClayColors.onSurfaceVariant))])),
                    Text('${DateTime.now().difference(tx.timestamp).inMinutes}m ago', style: const TextStyle(fontSize: 11, color: ClayColors.outlineVariant)),
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
