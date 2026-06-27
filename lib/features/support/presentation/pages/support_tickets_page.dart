import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SupportTicketsPage extends StatelessWidget {
  const SupportTicketsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tickets')),
      body: ListView(padding: const EdgeInsets.all(24), children: [
        _ticket('Refund Issue', '#TK102', 'Resolved', ClayColors.secondary),
        _ticket('Account Access', '#TK105', 'Pending', const Color(0xFF7F5604)),
      ]),
    );
  }
  Widget _ticket(String t, String id, String s, Color c) => Padding(padding: const EdgeInsets.only(bottom: 16), child: ClayContainer(borderRadius: 20, padding: const EdgeInsets.all(16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: const TextStyle(fontWeight: FontWeight.bold)), Text(id, style: const TextStyle(fontSize: 10))]), Text(s, style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 12))])));
}
