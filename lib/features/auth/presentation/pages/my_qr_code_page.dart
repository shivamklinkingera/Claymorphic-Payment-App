import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        backgroundColor: Colors.transparent, elevation: 0,
        title: const Text('My QR Code', style: TextStyle(color: ClayColors.primary, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClayContainer(
                borderRadius: 40, elevation: ClayElevation.level3, padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    ClayContainer(
                      width: 64, height: 64, borderRadius: 32, elevation: ClayElevation.level1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.network(user?.avatarUrl ?? '', fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.person)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(user?.name ?? 'Rahul', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(user?.upiId ?? 'rahul@payclay', style: const TextStyle(color: ClayColors.onSurfaceVariant)),
                    const SizedBox(height: 32),
                    ClayContainer(
                      borderRadius: 24, isSunken: true, padding: const EdgeInsets.all(16),
                      child: QrImageView(
                        data: 'upi://pay?pa=${user?.upiId}&pn=${user?.name}&cu=INR',
                        version: QrVersions.auto,
                        size: 200.0,
                        eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: ClayColors.primary),
                        dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: ClayColors.primary),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('Scan this QR to pay me', style: TextStyle(color: ClayColors.onSurfaceVariant, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
