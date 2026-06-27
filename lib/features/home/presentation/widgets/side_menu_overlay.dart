import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/providers.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SideMenuOverlay extends ConsumerWidget {
  const SideMenuOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    return Drawer(
      backgroundColor: ClayColors.background,
      child: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 32),
          child: Row(children: [
            ClayContainer(width: 64, height: 64, borderRadius: 32, child: ClipRRect(borderRadius: BorderRadius.circular(32), child: Image.network(user?.avatarUrl ?? '', fit: BoxFit.cover, errorBuilder: (c,e,s) => const Icon(Icons.person)))),
            const SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(user?.name ?? 'Rahul', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text(user?.upiId ?? 'rahul@payclay', style: const TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 12))])),
          ]),
        ),
        _item(context, Icons.home, 'Home', '/'),
        _item(context, Icons.account_balance_wallet, 'Wallet', '/wallet'),
        _item(context, Icons.analytics, 'Insights', '/spending-insights'),
        _item(context, Icons.help_outline, 'Help & Support', '/support'),
        const Spacer(),
        _item(context, Icons.logout, 'Logout', '/login_phone_number'),
        const SizedBox(height: 32),
      ]),
    );
  }
  Widget _item(BuildContext context, IconData i, String t, String r) => ListTile(leading: Icon(i, color: ClayColors.primary), title: Text(t, style: const TextStyle(fontWeight: FontWeight.bold)), onTap: () { Navigator.pop(context); context.go(r); });
}
