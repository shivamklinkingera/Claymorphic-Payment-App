import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/services/providers.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SelectContactPage extends ConsumerWidget {
  const SelectContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsAsync = ref.watch(userContactsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Contact'), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: ClayTextField(hintText: 'Search by name or number', prefixIcon: Icons.search),
          ),
          Expanded(
            child: contactsAsync.when(
              data: (contacts) => ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                    onTap: () => context.push('/send-money/amount', extra: contact),
                    leading: ClayContainer(
                      width: 48,
                      height: 48,
                      borderRadius: 24,
                      child: const Icon(Icons.person, color: ClayColors.primary),
                    ),
                    title: Text(contact.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(contact.upiId),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
