import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class DownloadStatementPage extends StatelessWidget {
  const DownloadStatementPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export Statement')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          const Text('Select Duration', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _chip('Last Month', true), _chip('3 Months', false), _chip('Custom', false),
          ]),
          const Spacer(),
          ClayButton(onPressed: () => Navigator.pop(context), width: double.infinity, child: const Text('Download PDF')),
          const SizedBox(height: 16),
          ClayButton(onPressed: () {}, color: ClayColors.surface, width: double.infinity, child: const Text('Send to Email')),
        ]),
      ),
    );
  }
  Widget _chip(String l, bool a) => ClayContainer(borderRadius: 20, color: a ? ClayColors.primary : ClayColors.surface, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: Text(l, style: TextStyle(color: a ? Colors.white : ClayColors.onSurface, fontSize: 12, fontWeight: FontWeight.bold)));
}
