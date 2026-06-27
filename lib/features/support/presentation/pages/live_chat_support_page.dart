import 'package:flutter/material.dart';
import '../../../../core/widgets/clay_text_field.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class LiveChatSupportPage extends StatelessWidget {
  const LiveChatSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Chat'), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: const [
                _ChatBubble(message: 'Hello! How can I help you today?', isMe: false),
                _ChatBubble(message: 'I have an issue with my last transaction.', isMe: true),
                _ChatBubble(message: 'Could you please provide the transaction ID?', isMe: false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                const Expanded(child: ClayTextField(hintText: 'Type a message...')),
                const SizedBox(width: 16),
                ClayContainer(
                  width: 56,
                  height: 56,
                  borderRadius: 28,
                  color: ClayColors.primary,
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  const _ChatBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: ClayContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: isMe ? ClayColors.primary : Colors.white,
          borderRadius: 16,
          child: Text(message, style: TextStyle(color: isMe ? Colors.white : ClayColors.onSurface)),
        ),
      ),
    );
  }
}
