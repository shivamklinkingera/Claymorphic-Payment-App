import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: ClayTextField(hintText: 'Search people, bills, transactions', prefixIcon: Icons.search),
          ),
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
