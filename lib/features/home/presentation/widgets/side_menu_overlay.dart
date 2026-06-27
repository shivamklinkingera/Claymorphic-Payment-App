import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/services/providers.dart';

class SideMenuOverlay extends ConsumerWidget {
  const SideMenuOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Material(
      color: Colors.black.withValues(alpha: 0.4),
      child: Stack(
        children: [
          GestureDetector(onTap: () => Navigator.pop(context)),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: ClayColors.surface,
              borderRadius: BorderRadius.only(topRight: Radius.circular(28), bottomRight: Radius.circular(28)),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        ClayContainer(width: 64, height: 64, borderRadius: 32, child: const Icon(Icons.person, size: 32, color: ClayColors.primary)),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user?.name ?? 'Rahul Kumar', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(user?.upiId ?? 'rahul@payclay', style: const TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  _MenuLink(icon: Icons.person_outline, label: 'My Profile', onTap: () => context.push('/profile')),
                  _MenuLink(icon: Icons.account_balance_outlined, label: 'Bank Accounts', onTap: () => context.push('/linked-banks')),
                  _MenuLink(icon: Icons.history, label: 'History', onTap: () => context.push('/history')),
                  const Spacer(),
                  const Divider(indent: 24, endIndent: 24),
                  _MenuLink(
                    icon: Icons.logout,
                    label: 'Logout',
                    color: ClayColors.error,
                    onTap: () {
                      ref.read(currentUserProvider.notifier).state = null;
                      context.go('/login_phone_number');
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  const _MenuLink({required this.icon, required this.label, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color ?? ClayColors.primary),
      title: Text(label, style: TextStyle(color: color ?? ClayColors.onSurface, fontWeight: FontWeight.bold)),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}
