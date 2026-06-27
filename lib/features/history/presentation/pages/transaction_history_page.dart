import '../../../../core/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/services/providers.dart';

class TransactionHistoryPage extends ConsumerWidget {
  const TransactionHistoryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(userTransactionsProvider);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, title: const Text('Transaction History', style: TextStyle(color: ClayColors.onSurface, fontWeight: FontWeight.bold))),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(userTransactionsProvider),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: transactions.when(
            data: (data) => data.isEmpty ? const Center(child: Text('No transactions yet')) : ListView.builder(itemCount: data.length, itemBuilder: (context, index) => _Item(t: data[index])),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => const Center(child: Text('Error loading history')),
          ),
        ),
      ),
    );
  }
}
class _Item extends StatelessWidget {
  final Transaction t; const _Item({required this.t});
  @override
  Widget build(BuildContext context) {
    final isSent = t.type == 'transfer';
    return Padding(padding: const EdgeInsets.only(bottom: 16.0), child: ClayContainer(borderRadius: 20, elevation: ClayElevation.level1, padding: const EdgeInsets.all(16), child: Row(children: [ClayContainer(width: 44, height: 44, borderRadius: 22, isSunken: true, child: Icon(isSent ? Icons.north_east : Icons.south_west, color: isSent ? ClayColors.error : ClayColors.secondary, size: 20)), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(isSent ? 'To: ${t.receiverName}' : 'From: ${t.senderName}', style: const TextStyle(fontWeight: FontWeight.bold)), Text(t.timestamp.toString().substring(0, 10), style: const TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 10))])), Text('${isSent ? "-" : "+"}₹${t.amount}', style: TextStyle(fontWeight: FontWeight.bold, color: isSent ? ClayColors.error : ClayColors.secondary))])));
  }
}
