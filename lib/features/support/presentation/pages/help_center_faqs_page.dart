import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class HelpCenterFaqsPage extends StatelessWidget {
  const HelpCenterFaqsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Center')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _item(context, 'How to reset UPI PIN?', '/faq-detail'),
          _item(context, 'Transaction failed issues', '/faq-detail'),
          const SizedBox(height: 32),
          ClayContainer(
            borderRadius: 20, padding: const EdgeInsets.all(20), color: ClayColors.secondaryContainer,
            child: InkWell(onTap: () => context.push('/live-chat'), child: Row(children: [const Icon(Icons.chat), const SizedBox(width: 16), const Text('Live Chat Support', style: TextStyle(fontWeight: FontWeight.bold))])),
          )
        ],
      ),
    );
  }
  Widget _item(BuildContext context, String t, String r) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: ClayContainer(borderRadius: 16, padding: const EdgeInsets.all(16), child: InkWell(onTap: () => context.push(r), child: Row(children: [Expanded(child: Text(t, style: const TextStyle(fontWeight: FontWeight.w600))), const Icon(Icons.chevron_right)]))),
  );
}
