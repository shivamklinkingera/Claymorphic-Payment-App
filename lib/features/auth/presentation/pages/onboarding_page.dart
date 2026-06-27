import 'package:flutter/material.dart';
import 'onboarding_welcome_page.dart';
import 'onboarding_send_receive_page.dart';
import 'onboarding_bills_recharges_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const [
          OnboardingWelcomePage(),
          OnboardingSendReceivePage(),
          OnboardingBillsRechargesPage(),
        ],
      ),
    );
  }
}
