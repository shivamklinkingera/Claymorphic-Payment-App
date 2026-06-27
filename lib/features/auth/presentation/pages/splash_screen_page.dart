import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) context.go('/onboarding_welcome');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Blobs
          Positioned(
            top: -50,
            left: -50,
            child: _Blob(color: ClayColors.primaryContainer.withValues(alpha: 0.2), size: 300),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: _Blob(color: ClayColors.secondaryContainer.withValues(alpha: 0.2), size: 350),
          ),

          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: ClayContainer(
                      width: 140,
                      height: 140,
                      borderRadius: 40,
                      elevation: ClayElevation.level3,
                      child: const Center(
                        child: Icon(
                          Icons.monetization_on,
                          size: 64,
                          color: ClayColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'PayClay',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: ClayColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Payments made effortless',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ClayColors.onSurfaceVariant.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Made with ',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ClayColors.outlineVariant,
                  ),
                ),
                const Icon(Icons.favorite, size: 14, color: ClayColors.error),
                Text(
                  ' in India',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ClayColors.outlineVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  final Color color;
  final double size;

  const _Blob({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Image.network(
        'https://via.placeholder.com/1', // Minimal invisible image to use blur
        errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
      ), // Note: Real blur is done via ImageFiltered or BackdropFilter usually
    );
  }
}
