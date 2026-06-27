import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_text_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            const ClayTextField(hintText: 'Search people or bills', prefixIcon: Icon(Icons.search)),
            const SizedBox(height: 32),
            const Align(alignment: Alignment.centerLeft, child: Text('Recent', style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 16),
            _recent('Priya Sharma'),
            _recent('Bescom Bill'),
          ]),
        ),
      ),
    );
  }
  Widget _recent(String t) => ListTile(leading: const Icon(Icons.history), title: Text(t));
}
