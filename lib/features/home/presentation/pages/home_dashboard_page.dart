import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/providers.dart';
import '../widgets/side_menu_overlay.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(userAccountsProvider).value ?? [];
    final balance = accounts.isNotEmpty ? accounts.first.balance : 0.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: ClayColors.primary),
          onPressed: () => _showSideMenu(context),
        ),
        title: Text('PayClay', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ClayColors.primary)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: ClayColors.primary),
            onPressed: () => context.push('/notifications'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => context.push('/profile'),
              child: ClayContainer(
                width: 40,
                height: 40,
                borderRadius: 20,
                elevation: ClayElevation.level1,
                child: const Icon(Icons.person, size: 24, color: ClayColors.primary),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ClayContainer(
              padding: const EdgeInsets.all(24),
              elevation: ClayElevation.level2,
              color: ClayColors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Balance', style: TextStyle(color: Colors.white70, fontSize: 16)),
                      Icon(Icons.account_balance_wallet_outlined, color: Colors.white70),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₹${balance.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ClayButton(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          onPressed: () => context.push('/add-money'),
                          child: const Text('Add Money', style: TextStyle(color: ClayColors.primary, fontSize: 14)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ClayButton(
                          color: ClayColors.primaryContainer,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          onPressed: () => context.push('/wallet'),
                          child: const Text('Wallet', style: TextStyle(color: Colors.white, fontSize: 14)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const _SectionTitle(title: 'Quick Actions'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _QuickAction(icon: Icons.qr_code_scanner, label: 'Scan & Pay', onTap: () => context.push('/scan-pay')),
                _QuickAction(icon: Icons.person_add_outlined, label: 'To Contact', onTap: () => context.push('/send-money')),
                _QuickAction(icon: Icons.account_balance_outlined, label: 'To Bank', onTap: () => context.push('/bank-transfer')),
                _QuickAction(icon: Icons.history, label: 'History', onTap: () => context.push('/history')),
              ],
            ),
            const SizedBox(height: 32),
            const _SectionTitle(title: 'Bills & Recharges'),
            const SizedBox(height: 16),
            ClayContainer(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                children: [
                  _ServiceItem(icon: Icons.phone_android, label: 'Mobile', onTap: () => context.push('/mobile-recharge')),
                  _ServiceItem(icon: Icons.lightbulb_outline, label: 'Electricity', onTap: () => context.push('/electricity-bill')),
                  _ServiceItem(icon: Icons.tv, label: 'DTH', onTap: () => context.push('/dth-recharge')),
                  _ServiceItem(icon: Icons.local_fire_department, label: 'Gas', onTap: () => context.push('/gas-bill')),
                  _ServiceItem(icon: Icons.more_horiz, label: 'More', onTap: () => context.push('/bills')),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  void _showSideMenu(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Menu',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, _, __) => const SideMenuOverlay(),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: () {}, child: const Text('View All')),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _QuickAction({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClayContainer(
            width: 64,
            height: 64,
            borderRadius: 20,
            child: Icon(icon, color: ClayColors.primary, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ServiceItem({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: ClayColors.onSurfaceVariant, size: 24),
          const SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
