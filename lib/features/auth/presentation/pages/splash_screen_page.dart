import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});
  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeIn)));
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack)));
    _controller.forward();
    Future.delayed(const Duration(seconds: 3), () { if (mounted) context.go('/onboarding_welcome'); });
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: -50, left: -50, child: Container(width: 250, height: 250, decoration: BoxDecoration(shape: BoxShape.circle, gradient: const LinearGradient(colors: [Color(0xFFD1E4FF), Color(0xFF8AF8C5)]), boxShadow: [BoxShadow(color: const Color(0xFFD1E4FF).withValues(alpha: 0.5), blurRadius: 100, spreadRadius: 50)]))),
          Positioned(bottom: -50, right: -50, child: Container(width: 300, height: 300, decoration: BoxDecoration(shape: BoxShape.circle, gradient: const LinearGradient(colors: [Color(0xFFFFDDAF), Color(0xFFDEE0FF)]), boxShadow: [BoxShadow(color: const Color(0xFFFFDDAF).withValues(alpha: 0.5), blurRadius: 100, spreadRadius: 50)]))),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => Opacity(
                opacity: _fadeAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const ClayContainer(width: 140, height: 140, borderRadius: 40, elevation: ClayElevation.level3, child: Icon(Icons.monetization_on, size: 64, color: ClayColors.primary)),
                    const SizedBox(height: 32),
                    Text('PayClay', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: ClayColors.primary, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    const Text('Payments made effortless', style: TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 14, fontWeight: FontWeight.w600)),
                  ]),
                ),
              ),
            ),
          ),
          const Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsets.only(bottom: 32.0), child: Row(mainAxisSize: MainAxisSize.min, children: [Text('Made with ', style: TextStyle(color: ClayColors.outline, fontSize: 12)), Icon(Icons.favorite, color: ClayColors.error, size: 14), Text(' in India', style: TextStyle(color: ClayColors.outline, fontSize: 12))]))),
        ],
      ),
    );
  }
}
