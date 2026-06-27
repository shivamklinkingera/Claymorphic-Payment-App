import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), backgroundColor: Colors.transparent),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ClayContainer(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClayContainer(
                  width: 48,
                  height: 48,
                  borderRadius: 24,
                  color: ClayColors.primaryContainer.withValues(alpha: 0.1),
                  child: const Icon(Icons.notifications_outlined, color: ClayColors.primary),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Payment Received', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('You received ₹500 from Amit Shah', style: TextStyle(fontSize: 13, color: ClayColors.onSurfaceVariant)),
                    ],
                  ),
                ),
                const Text('2m ago', style: TextStyle(fontSize: 11, color: ClayColors.outlineVariant)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
