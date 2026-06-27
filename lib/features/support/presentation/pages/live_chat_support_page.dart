import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';
import '../../../../core/widgets/clay_text_field.dart';

class LiveChatSupportPage extends StatelessWidget {
  const LiveChatSupportPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support Chat')),
      body: Column(children: [
        Expanded(child: ListView(padding: const EdgeInsets.all(24), children: [
          _msg('Hello! How can we help you?', false),
          _msg('My last payment is pending.', true),
        ])),
        Padding(padding: const EdgeInsets.all(24), child: Row(children: [const Expanded(child: ClayTextField(hintText: 'Type here...')), const SizedBox(width: 12), ClayContainer(width: 50, height: 50, borderRadius: 25, color: ClayColors.primary, child: const Icon(Icons.send, color: Colors.white))])),
      ]),
    );
  }
  Widget _msg(String t, bool m) => Align(alignment: m ? Alignment.centerRight : Alignment.centerLeft, child: Padding(padding: const EdgeInsets.only(bottom: 16), child: ClayContainer(borderRadius: 16, color: m ? ClayColors.primary : Colors.white, padding: const EdgeInsets.all(12), child: Text(t, style: TextStyle(color: m ? Colors.white : ClayColors.onSurface)))));
}
