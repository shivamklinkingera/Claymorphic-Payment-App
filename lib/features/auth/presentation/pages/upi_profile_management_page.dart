import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/providers.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class UpiProfilePage extends ConsumerWidget {
  const UpiProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Stack(
                children: [
                  ClayContainer(
                    width: 120,
                    height: 120,
                    borderRadius: 60,
                    elevation: ClayElevation.level2,
                    child: const Icon(Icons.person, size: 60, color: ClayColors.primary),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ClayContainer(
                      width: 40,
                      height: 40,
                      borderRadius: 20,
                      color: ClayColors.primary,
                      child: const Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user?.name ?? 'Rahul Kumar',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              user?.upiId ?? 'rahul@payclay',
              style: const TextStyle(color: ClayColors.onSurfaceVariant),
            ),
            const SizedBox(height: 40),
            _ProfileItem(
              icon: Icons.qr_code,
              label: 'My QR Code',
              onTap: () => context.push('/my-qr'),
            ),
            const SizedBox(height: 16),
            _ProfileItem(
              icon: Icons.account_balance,
              label: 'Linked Bank Accounts',
              onTap: () => context.push('/linked-banks'),
            ),
            const SizedBox(height: 16),
            _ProfileItem(
              icon: Icons.lock_outline,
              label: 'Change UPI PIN',
              onTap: () => context.push('/change-pin'),
            ),
            const SizedBox(height: 16),
            _ProfileItem(
              icon: Icons.help_outline,
              label: 'Help & Support',
              onTap: () => context.push('/support'),
            ),
            const SizedBox(height: 16),
            _ProfileItem(
              icon: Icons.logout,
              label: 'Logout',
              iconColor: ClayColors.error,
              onTap: () => context.go('/login_phone_number'),
            ),
            const SizedBox(height: 100), // Navigation bar spacing
          ],
        ),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;

  const _ProfileItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        elevation: ClayElevation.level1,
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? ClayColors.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const Icon(Icons.chevron_right, color: ClayColors.outlineVariant),
          ],
        ),
      ),
    );
  }
}
