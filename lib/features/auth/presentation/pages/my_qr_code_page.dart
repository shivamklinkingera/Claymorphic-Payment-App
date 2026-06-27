import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/services/providers.dart';

class MyQrCodePage extends ConsumerWidget {
  const MyQrCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My QR Code'),
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
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClayContainer(
                padding: const EdgeInsets.all(32),
                elevation: ClayElevation.level3,
                borderRadius: 40,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user?.name ?? 'Rahul Kumar',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user?.upiId ?? 'rahul@payclay',
                      style: const TextStyle(color: ClayColors.onSurfaceVariant),
                    ),
                    const SizedBox(height: 32),
                    QrImageView(
                      data: 'upi://pay?pa=${user?.upiId ?? "rahul@payclay"}&pn=${user?.name ?? "Rahul Kumar"}',
                      version: QrVersions.auto,
                      size: 200.0,
                      dataModuleStyle: const QrDataModuleStyle(
                        color: ClayColors.onSurface,
                        dataModuleShape: QrDataModuleShape.square,
                      ),
                      eyeStyle: const QrEyeStyle(
                        color: ClayColors.onSurface,
                        eyeShape: QrEyeShape.square,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ActionIcon(icon: Icons.share, label: 'Share QR'),
                  _ActionIcon(icon: Icons.download, label: 'Download'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClayContainer(
          width: 56,
          height: 56,
          borderRadius: 28,
          child: Icon(icon, color: ClayColors.primary),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
