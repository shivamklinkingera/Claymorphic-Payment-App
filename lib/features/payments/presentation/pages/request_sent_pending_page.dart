import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class RequestSentPendingPage extends StatelessWidget {
  const RequestSentPendingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            const Spacer(),
            const ClayContainer(width: 120, height: 120, borderRadius: 60, color: Color(0xFFFFDDAF), child: Icon(Icons.hourglass_empty, size: 64, color: Color(0xFF7F5604))),
            const SizedBox(height: 32),
            const Text('Request Sent!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('₹500.00', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: ClayColors.primary)),
            const SizedBox(height: 8),
            const Text('Requested from Priya Sharma', style: TextStyle(color: ClayColors.onSurfaceVariant)),
            const Spacer(),
            ClayButton(onPressed: () => context.go('/'), width: double.infinity, child: const Text('Done')),
          ]),
        ),
      ),
    );
  }
}
