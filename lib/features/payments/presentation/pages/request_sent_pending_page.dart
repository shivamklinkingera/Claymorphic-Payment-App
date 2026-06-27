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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClayContainer(
                width: 100,
                height: 100,
                borderRadius: 50,
                child: const Icon(Icons.timer_outlined, size: 48, color: ClayColors.tertiary),
              ),
              const SizedBox(height: 32),
              const Text('Request Sent', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text(
                'Waiting for Priya Sharma to approve your request of ₹500',
                textAlign: TextAlign.center,
                style: TextStyle(color: ClayColors.onSurfaceVariant),
              ),
              const SizedBox(height: 48),
              ClayButton(
                onPressed: () => context.go('/'),
                width: double.infinity,
                child: const Text('Go to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
