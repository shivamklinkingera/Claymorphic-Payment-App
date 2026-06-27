import 'package:flutter/material.dart';

class FaqDetailPage extends StatelessWidget {
  const FaqDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQ Detail'), backgroundColor: Colors.transparent),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text('Detailed explanation of the issue and how to resolve it will be displayed here.'),
      ),
    );
  }
}
