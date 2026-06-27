import '../../../../core/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/services/providers.dart';
import '../widgets/side_menu_overlay.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final accounts = ref.watch(userAccountsProvider);
    final transactions = ref.watch(userTransactionsProvider);

    return Scaffold(
      drawer: const SideMenuOverlay(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildHeader(context, user),
              const SizedBox(height: 24),
              _buildSearchBar(context),
              const SizedBox(height: 32),
              _buildBalanceCard(context, accounts),
              const SizedBox(height: 32),
              _buildQuickActions(context),
              const SizedBox(height: 32),
              const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildRecentTransactions(transactions),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, User? user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: ClayColors.primary),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Good Morning,', style: TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 14)),
                Text(user?.name ?? 'Rahul', style: const TextStyle(color: ClayColors.onSurface, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            const ClayContainer(
              width: 40, height: 40, borderRadius: 20, elevation: ClayElevation.level1,
              child: Icon(Icons.notifications, color: ClayColors.onSurfaceVariant, size: 20),
            ),
            const SizedBox(width: 12),
            ClayContainer(
              width: 44, height: 44, borderRadius: 22, elevation: ClayElevation.level1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.network(user?.avatarUrl ?? '', fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.person)),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/search'),
      child: const ClayContainer(
        height: 52, borderRadius: 26, isSunken: true, padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [Icon(Icons.search, color: ClayColors.outline), SizedBox(width: 12), Text('Search people, bills, offers...', style: TextStyle(color: ClayColors.outline))]),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context, AsyncValue<List<BankAccount>> accounts) {
    return accounts.when(
      data: (data) => ClayContainer(
        borderRadius: 24, color: ClayColors.primaryContainer, padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Wallet Balance', style: TextStyle(color: Colors.white70, fontSize: 13)), Icon(Icons.visibility, color: Colors.white70, size: 20)]),
            const SizedBox(height: 4),
            Text('₹${data.isEmpty ? "0.00" : data.first.balance.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800)),
            const SizedBox(height: 24),
            Row(children: [
              ClayButton(onPressed: () => context.push('/add-money'), color: Colors.white, child: const Text('Add Money', style: TextStyle(color: ClayColors.primary))),
              const SizedBox(width: 12),
              OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white30), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999))), child: const Text('Withdraw', style: TextStyle(color: Colors.white))),
            ])
          ],
        ),
      ),
      loading: () => const ClayContainer(height: 150, child: Center(child: CircularProgressIndicator())),
      error: (e, s) => const Text('Error loading balance'),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 4, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 0.8,
      children: [
        _ActionItem('Scan', Icons.qr_code_scanner, ClayColors.primaryContainer, () => context.push('/scan-pay')),
        _ActionItem('Send', Icons.send, ClayColors.secondaryContainer, () => context.push('/send-money')),
        _ActionItem('Bills', Icons.receipt_long, const Color(0xFFFFDDAF), () => context.push('/bills')),
        _ActionItem('Wealth', Icons.analytics, const Color(0xFFD1E4FF), () => context.push('/wealth')),
      ],
    );
  }

  Widget _buildRecentTransactions(AsyncValue<List<Transaction>> transactions) {
    return transactions.when(
      data: (data) => Column(children: data.take(5).map((t) => _TransactionTile(t: t)).toList()),
      loading: () => const CircularProgressIndicator(),
      error: (e, s) => const Text('Error'),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final String l; final IconData i; final Color c; final VoidCallback onTap;
  const _ActionItem(this.l, this.i, this.c, this.onTap);
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Column(children: [ClayContainer(width: 50, height: 50, borderRadius: 25, color: c, child: Icon(i, color: ClayColors.onSurface)), const SizedBox(height: 8), Text(l, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))]),
  );
}

class _TransactionTile extends StatelessWidget {
  final Transaction t; const _TransactionTile({required this.t});
  @override
  Widget build(BuildContext context) {
    final isSent = t.type == 'transfer';
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ClayContainer(
        borderRadius: 16, elevation: ClayElevation.level1, padding: const EdgeInsets.all(12),
        child: Row(children: [
          ClayContainer(width: 40, height: 40, borderRadius: 20, isSunken: true, child: Icon(isSent ? Icons.north_east : Icons.south_west, size: 20, color: isSent ? ClayColors.error : ClayColors.secondary)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(isSent ? 'To: ${t.receiverName}' : 'From: ${t.senderName}', style: const TextStyle(fontWeight: FontWeight.bold)), Text(t.timestamp.toString().substring(0, 10), style: const TextStyle(fontSize: 10, color: ClayColors.onSurfaceVariant))])),
          Text('${isSent ? "-" : "+"}₹${t.amount.toStringAsFixed(0)}', style: TextStyle(fontWeight: FontWeight.bold, color: isSent ? ClayColors.error : ClayColors.secondary)),
        ]),
      ),
    );
  }
}
