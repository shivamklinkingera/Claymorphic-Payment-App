import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/services/providers.dart';

class ScanPayQrScannerPage extends ConsumerStatefulWidget {
  const ScanPayQrScannerPage({super.key});
  @override
  ConsumerState<ScanPayQrScannerPage> createState() => _ScanPayQrScannerPageState();
}

class _ScanPayQrScannerPageState extends ConsumerState<ScanPayQrScannerPage> {
  final MobileScannerController _controller = MobileScannerController();

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        MobileScanner(controller: _controller, onDetect: (c) async {
          if (c.barcodes.isNotEmpty) {
            _controller.stop();
            final contacts = await ref.read(userContactsProvider.future);
            if (!context.mounted) return; context.pushReplacement('/send-money/amount', extra: contacts.first);
          }
        }),
        SafeArea(child: Padding(padding: const EdgeInsets.all(24), child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ClayContainer(width: 44, height: 44, borderRadius: 22, child: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context))),
            const Text('Scan & Pay', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ClayContainer(width: 44, height: 44, borderRadius: 22, child: IconButton(icon: const Icon(Icons.flash_on), onPressed: () => _controller.toggleTorch())),
          ]),
          const Spacer(),
          Container(width: 250, height: 250, decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: BorderRadius.circular(32))),
          const Spacer(),
          ClayContainer(borderRadius: 24, padding: const EdgeInsets.all(16), child: Row(mainAxisSize: MainAxisSize.min, children: [IconButton(onPressed: () => context.push('/my-qr'), icon: const Icon(Icons.qr_code, color: ClayColors.primary)), const SizedBox(width: 16), const Icon(Icons.photo_library, color: ClayColors.primary)])),
          const SizedBox(height: 48),
        ])))
      ]),
    );
  }
}
