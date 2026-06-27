import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/services/providers.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final contacts = ref.watch(userContactsProvider).value ?? [];
    final filteredContacts = contacts.where((c) =>
      c.name.toLowerCase().contains(query.toLowerCase()) ||
      c.upiId.toLowerCase().contains(query.toLowerCase())
    ).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search'), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: ClayTextField(
              hintText: 'Search people or UPI ID',
              prefixIcon: Icons.search,
              onChanged: (val) => setState(() => query = val),
            ),
          ),
          if (query.isNotEmpty) ...[
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 24),
               child: Row(children: [Text('Results', style: TextStyle(fontWeight: FontWeight.bold))]),
             ),
             Expanded(
               child: ListView.builder(
                 itemCount: filteredContacts.length,
                 itemBuilder: (context, index) {
                   final contact = filteredContacts[index];
                   return ListTile(
                     title: Text(contact.name),
                     subtitle: Text(contact.upiId),
                     leading: const CircleAvatar(child: Icon(Icons.person)),
                   );
                 },
               ),
             ),
          ] else ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text('Recent Searches', style: TextStyle(fontWeight: FontWeight.bold, color: ClayColors.onSurfaceVariant)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: const [
                  _RecentSearchItem('Priya Sharma'),
                  _RecentSearchItem('Electric Bill'),
                  _RecentSearchItem('Amit Shah'),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _RecentSearchItem extends StatelessWidget {
  final String text;
  const _RecentSearchItem(this.text);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.history, color: ClayColors.outlineVariant),
      title: Text(text),
      trailing: const Icon(Icons.north_west, color: ClayColors.outlineVariant, size: 16),
      onTap: () {},
    );
  }
}
