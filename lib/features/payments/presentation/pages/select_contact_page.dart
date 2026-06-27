import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/services/providers.dart';
import '../../../../core/data/database.dart';

class SelectContactPage extends ConsumerWidget {
  const SelectContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(userContactsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClayContainer(
            borderRadius: 999,
            elevation: ClayElevation.level1,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: ClayColors.primary),
              onPressed: () => context.pop(),
            ),
          ),
        ),
        title: const Text('Send to', style: TextStyle(color: ClayColors.onSurface, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const ClayTextField(
              hintText: 'Enter name, phone or UPI ID',
              prefixIcon: Icon(Icons.search, color: ClayColors.outline),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: contacts.when(
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final contact = data[index];
                    return _ContactTile(contact: contact);
                  },
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => const Center(child: Text('Error loading contacts')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final Contact contact;
  const _ContactTile({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ClayContainer(
        borderRadius: 16,
        elevation: ClayElevation.level1,
        padding: const EdgeInsets.all(12),
        child: InkWell(
          onTap: () => context.push('/send-money/amount', extra: contact),
          child: Row(
            children: [
              ClayContainer(
                width: 48,
                height: 48,
                borderRadius: 24,
                elevation: ClayElevation.level1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(contact.avatarUrl ?? '', fit: BoxFit.cover, errorBuilder: (c,e,s) => const Icon(Icons.person)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(contact.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(contact.upiId, style: const TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: ClayColors.outlineVariant),
            ],
          ),
        ),
      ),
    );
  }
}
