import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class DownloadStatementPage extends StatelessWidget {
  const DownloadStatementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download Statement'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Duration', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _DurationChip('Last Month', true),
                _DurationChip('Last 3 Months', false),
                _DurationChip('Last 6 Months', false),
                _DurationChip('Custom Range', false),
              ],
            ),
            const SizedBox(height: 32),
            const Text('OR CUSTOM RANGE', style: TextStyle(fontSize: 12, color: ClayColors.onSurfaceVariant, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(child: ClayTextField(hintText: 'Start Date')),
                SizedBox(width: 16),
                Expanded(child: ClayTextField(hintText: 'End Date')),
              ],
            ),
            const Spacer(),
            ClayButton(
              onPressed: () {},
              width: double.infinity,
              child: const Text('Generate Statement'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _DurationChip extends StatelessWidget {
  final String label;
  final bool active;
  const _DurationChip(this.label, this.active);
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: active ? ClayColors.primary : Colors.white,
      child: Text(label, style: TextStyle(color: active ? Colors.white : ClayColors.onSurface, fontWeight: FontWeight.bold)),
    );
  }
}
