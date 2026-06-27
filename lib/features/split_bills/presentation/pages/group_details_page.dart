import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class GroupDetailsPage extends StatelessWidget {
  final String groupName;
  const GroupDetailsPage({super.key, required this.groupName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(groupName)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          ClayContainer(
            borderRadius: 24, padding: const EdgeInsets.all(24),
            child: const Column(children: [Text('You are owed'), Text('₹2,450.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: ClayColors.secondary))]),
          ),
          const SizedBox(height: 32),
          _member('Priya Sharma', 'Owes ₹1,200', true),
          _member('Amit Kumar', 'Owes ₹1,250', true),
        ]),
      ),
    );
  }
  Widget _member(String n, String s, bool o) => Padding(padding: const EdgeInsets.only(bottom: 16), child: ClayContainer(borderRadius: 16, padding: const EdgeInsets.all(16), child: Row(children: [const Icon(Icons.person), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(n, style: const TextStyle(fontWeight: FontWeight.bold)), Text(s, style: const TextStyle(fontSize: 10))])), if (o) const Text('Settle', style: TextStyle(color: ClayColors.primary, fontWeight: FontWeight.bold))])));
}
