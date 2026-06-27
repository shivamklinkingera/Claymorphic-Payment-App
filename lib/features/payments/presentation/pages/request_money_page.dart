import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/services/providers.dart';

class RequestMoneyPage extends ConsumerStatefulWidget {
  const RequestMoneyPage({super.key});
  @override
  ConsumerState<RequestMoneyPage> createState() => _RequestMoneyPageState();
}

class _RequestMoneyPageState extends ConsumerState<RequestMoneyPage> {
  final TextEditingController _amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final contacts = ref.watch(userContactsProvider);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, title: const Text('Request Money', style: TextStyle(color: ClayColors.primary, fontWeight: FontWeight.bold))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Select Contact', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          SizedBox(height: 100, child: contacts.when(data: (data) => ListView.builder(scrollDirection: Axis.horizontal, itemCount: data.length, itemBuilder: (c,i) => Padding(padding: const EdgeInsets.only(right: 16), child: Column(children: [ClayContainer(width: 56, height: 56, borderRadius: 28, child: ClipRRect(borderRadius: BorderRadius.circular(28), child: Image.network(data[i].avatarUrl ?? '', fit: BoxFit.cover, errorBuilder: (c,e,s) => const Icon(Icons.person)))), const SizedBox(height: 4), Text(data[i].name, style: const TextStyle(fontSize: 10))]))), loading: () => const SizedBox(), error: (e,s) => const SizedBox())),
          const SizedBox(height: 32),
          ClayTextField(controller: _amount, labelText: 'Amount', hintText: '₹ 0.00', keyboardType: TextInputType.number),
          const Spacer(),
          ClayButton(onPressed: () => context.push('/request-success'), width: double.infinity, child: const Text('Send Request')),
        ]),
      ),
    );
  }
}
