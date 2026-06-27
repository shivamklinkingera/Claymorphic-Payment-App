import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/services/providers.dart';

class UpiProfilePage extends ConsumerWidget {
  const UpiProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClayContainer(
            borderRadius: 999,
            elevation: ClayElevation.level1,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: ClayColors.primary),
              onPressed: () => context.pop(),
            ),
          ),
        ),
        title: const Text('UPI Profile', style: TextStyle(color: ClayColors.primary, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClayContainer(
              borderRadius: 32,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClayContainer(
                        width: 64, height: 64, borderRadius: 32, elevation: ClayElevation.level1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Image.network(user?.avatarUrl ?? '', fit: BoxFit.cover, errorBuilder: (c,e,s) => const Icon(Icons.person)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user?.name ?? 'Rahul', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(user?.upiId ?? 'rahul@payclay', style: const TextStyle(color: ClayColors.onSurfaceVariant)),
                        ],
                      ),
                      const Spacer(),
                      IconButton(onPressed: () => context.push('/my-qr'), icon: const Icon(Icons.qr_code, color: ClayColors.primary)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildOption(context, Icons.account_balance, 'Linked Bank Accounts', '/linked-banks'),
                  _buildOption(context, Icons.lock_reset, 'Change UPI PIN', '/change-pin'),
                  _buildOption(context, Icons.speed, 'Transaction Limit', null),
                  _buildOption(context, Icons.help_outline, 'Help & Support', '/support'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ClayButton(
              onPressed: () => context.go('/login_phone_number'),
              color: ClayColors.errorContainer,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: ClayColors.error),
                  SizedBox(width: 8),
                  Text('Logout', style: TextStyle(color: ClayColors.error, fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, IconData icon, String title, String? route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: InkWell(
        onTap: route != null ? () => context.push(route) : null,
        child: Row(
          children: [
            ClayContainer(
              width: 40, height: 40, borderRadius: 12, isSunken: true,
              child: Icon(icon, size: 20, color: ClayColors.primary),
            ),
            const SizedBox(width: 16),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            const Icon(Icons.chevron_right, color: ClayColors.outlineVariant),
          ],
        ),
      ),
    );
  }
}
