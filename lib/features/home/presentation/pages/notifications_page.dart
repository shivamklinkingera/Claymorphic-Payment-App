import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _item('Payment Received', 'You received ₹500 from Priya', Icons.south_west, ClayColors.secondaryContainer),
          _item('Bill Due', 'Electricity bill is due tomorrow', Icons.bolt, const Color(0xFFFFDDAF)),
        ],
      ),
    );
  }
  Widget _item(String t, String m, IconData i, Color c) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: ClayContainer(
      borderRadius: 20, padding: const EdgeInsets.all(16),
      child: Row(children: [
        ClayContainer(width: 44, height: 44, borderRadius: 12, color: c, child: Icon(i)),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: const TextStyle(fontWeight: FontWeight.bold)), Text(m, style: const TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant))])),
      ]),
    ),
  );
}
