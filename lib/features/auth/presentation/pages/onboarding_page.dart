import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(child: PageView(controller: _pageController, onPageChanged: (i) => setState(() => _currentPage = i), children: [
            _Page('Welcome to PayClay', 'Your all-in-one payment companion', Icons.qr_code_2, ClayColors.primaryContainer),
            _Page('Send & Receive', 'Instantly transfer money to anyone, anywhere', Icons.send, ClayColors.secondaryContainer),
            _Page('Pay Bills in Seconds', 'Recharge, pay electricity, water, gas bills', Icons.receipt_long, const Color(0xFFFFDDAF)),
          ])),
          Padding(padding: const EdgeInsets.all(32.0), child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(3, (i) => AnimatedContainer(duration: const Duration(milliseconds: 300), margin: const EdgeInsets.symmetric(horizontal: 4), height: 8, width: _currentPage == i ? 24 : 8, decoration: BoxDecoration(color: _currentPage == i ? ClayColors.primary : ClayColors.outlineVariant, borderRadius: BorderRadius.circular(4))))),
            const SizedBox(height: 32),
            ClayButton(onPressed: () => _currentPage < 2 ? _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease) : context.go('/login_phone_number'), width: double.infinity, child: Text(_currentPage == 2 ? 'Get Started' : 'Next')),
            const SizedBox(height: 16),
            TextButton(onPressed: () => context.go('/login_phone_number'), child: const Text('Already have an account? Log in', style: TextStyle(color: ClayColors.onSurfaceVariant))),
          ]))
        ]),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final String t, d; final IconData i; final Color c;
  const _Page(this.t, this.d, this.i, this.c);
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.all(24.0), child: Column(children: [
    Expanded(child: ClayContainer(width: double.infinity, borderRadius: 48, child: Center(child: ClayContainer(width: 120, height: 120, borderRadius: 30, color: c, child: Icon(i, size: 64, color: ClayColors.onSurface))))),
    const SizedBox(height: 48),
    Text(t, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
    const SizedBox(height: 16),
    Text(d, textAlign: TextAlign.center, style: const TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 16)),
  ]));
}
