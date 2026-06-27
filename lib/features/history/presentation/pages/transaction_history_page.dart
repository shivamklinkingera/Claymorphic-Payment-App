import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/providers.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class TransactionHistoryPage extends ConsumerWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(userTransactionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(icon: const Icon(Icons.bar_chart), onPressed: () => context.push('/spending-insights')),
          IconButton(icon: const Icon(Icons.download), onPressed: () => context.push('/download-statement')),
        ],
      ),
      body: transactionsAsync.when(
        data: (transactions) => ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final tx = transactions[index];
            final isDebit = tx.type == 'DEBIT';
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () => context.push('/transaction-details', extra: tx),
                child: ClayContainer(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      ClayContainer(
                        width: 48,
                        height: 48,
                        borderRadius: 24,
                        child: Icon(isDebit ? Icons.arrow_upward : Icons.arrow_downward, color: isDebit ? ClayColors.error : ClayColors.secondary),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(isDebit ? 'To ${tx.receiverName}' : 'From ${tx.senderName}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(tx.timestamp.toString().substring(0, 16), style: const TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant)),
                          ],
                        ),
                      ),
                      Text(
                        '${isDebit ? "-" : "+"}₹${tx.amount}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isDebit ? ClayColors.onSurface : ClayColors.secondary),
                      ),
                    ],
                  ),
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
