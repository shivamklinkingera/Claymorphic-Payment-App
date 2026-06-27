import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class HelpCenterFaqsPage extends StatelessWidget {
  const HelpCenterFaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Center'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ClayTextField(hintText: 'Search for issues', prefixIcon: Icons.search),
            const SizedBox(height: 32),
            _SupportAction(
              icon: Icons.chat_bubble_outline,
              label: 'Live Chat',
              onTap: () => context.push('/live-chat'),
            ),
            const SizedBox(height: 16),
            _SupportAction(
              icon: Icons.confirmation_number_outlined,
              label: 'Support Tickets',
              onTap: () => context.push('/support-tickets'),
            ),
            const SizedBox(height: 32),
            const Align(alignment: Alignment.centerLeft, child: Text('Frequently Asked Questions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 16),
            _FaqItem(question: 'How to reset UPI PIN?', onTap: () => context.push('/faq-upi-reset')),
            _FaqItem(question: 'Transaction pending for 2 days', onTap: () => context.push('/faq-detail')),
            _FaqItem(question: 'How to add a secondary bank account?', onTap: () => context.push('/faq-detail')),
          ],
        ),
      ),
    );
  }
}

class _SupportAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _SupportAction({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon, color: ClayColors.primary),
            const SizedBox(width: 16),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Spacer(),
            const Icon(Icons.chevron_right, color: ClayColors.outlineVariant),
          ],
        ),
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final String question;
  final VoidCallback onTap;
  const _FaqItem({required this.question, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: ClayContainer(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(child: Text(question)),
              const Icon(Icons.keyboard_arrow_right, color: ClayColors.outlineVariant),
            ],
          ),
        ),
      ),
    );
  }
}
