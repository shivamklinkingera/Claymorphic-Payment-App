import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_button.dart';

class PayClayComponentLibraryPage extends StatelessWidget {
  const PayClayComponentLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Component Library'), backgroundColor: Colors.transparent),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Containers', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const ClayContainer(height: 100, child: Center(child: Text('Level 2 (Default)'))),
          const SizedBox(height: 16),
          const ClayContainer(height: 100, elevation: ClayElevation.level1, child: Center(child: Text('Level 1'))),
          const SizedBox(height: 16),
          const ClayContainer(height: 100, elevation: ClayElevation.level3, child: Center(child: Text('Level 3'))),
          const SizedBox(height: 32),
          const Text('Buttons', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ClayButton(onPressed: () {}, child: const Text('Primary Button')),
          const SizedBox(height: 16),
          ClayButton(color: ClayColors.secondary, onPressed: () {}, child: const Text('Secondary Button')),
          const SizedBox(height: 16),
          ClayButton(color: ClayColors.surface, onPressed: () {}, child: const Text('Surface Button')),
          const SizedBox(height: 32),
          const Text('Inputs', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const ClayTextField(hintText: 'Standard Input', prefixIcon: Icons.edit),
        ],
      ),
    );
  }
}
