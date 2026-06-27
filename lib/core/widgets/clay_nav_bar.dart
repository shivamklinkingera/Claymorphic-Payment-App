import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/clay_theme.dart';
import 'clay_container.dart';
class ClayNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const ClayNavBar({super.key, required this.navigationShell});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: ClayContainer(
        borderRadius: 24, elevation: ClayElevation.level3, padding: const EdgeInsets.all(8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _NavBarItem(icon: Icons.home, label: 'Home', isActive: navigationShell.currentIndex == 0, onTap: () => navigationShell.goBranch(0)),
          _NavBarItem(icon: Icons.receipt_long, label: 'History', isActive: navigationShell.currentIndex == 1, onTap: () => navigationShell.goBranch(1)),
          _NavBarItem(icon: Icons.local_offer, label: 'Offers', isActive: navigationShell.currentIndex == 2, onTap: () => navigationShell.goBranch(2)),
          _NavBarItem(icon: Icons.person, label: 'Profile', isActive: navigationShell.currentIndex == 3, onTap: () => navigationShell.goBranch(3)),
        ]),
      ),
    );
  }
}
class _NavBarItem extends StatelessWidget {
  final IconData icon; final String label; final bool isActive; final VoidCallback onTap;
  const _NavBarItem({required this.icon, required this.label, required this.isActive, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isActive ? BoxDecoration(color: ClayColors.primaryContainer, borderRadius: BorderRadius.circular(16)) : null,
        child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: isActive ? ClayColors.onPrimaryContainer : ClayColors.onSurfaceVariant), if (isActive) ...[const SizedBox(height: 4), Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: ClayColors.onPrimaryContainer))]]),
      ),
    );
  }
}
