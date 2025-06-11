import 'dart:async';
import 'package:flutter/material.dart';
import 'package:profile_static/models/profile.dart';
import 'package:profile_static/screens/detail_profile.dart';

class ChatPage extends StatefulWidget {
  final Profile friend;

  const ChatPage({super.key, required this.friend});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, String>> messages = []; // simpan sender + text
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({'sender': 'me', 'text': text});
      _controller.clear();
    });

    _simulateBotReply(); // Jawaban otomatis setelah user kirim
  }

  void _simulateBotReply() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        messages.add({
          'sender': 'bot',
          'text': _getBotReply(),
        });
      });
    });
  }

  String _getBotReply() {
    // Daftar balasan acak
    final replies = [
      "Saya mengerti 😄",
      "Wah, menarik banget!",
      "Oke noted yaa~",
      "Sip, terima kasih 🙏",
      "Coba jelaskan lebih lanjut dong 😅"
    ];
    replies.shuffle();
    return replies.first;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailProfile(profile: widget.friend),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.friend.imageUrl),
              ),
              const SizedBox(width: 8),
              Text(widget.friend.name),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[messages.length - 1 - index];
                final isMe = msg['sender'] == 'me';
                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.pink[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg['text'] ?? ''),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ketik pesan...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: const Text("Kirim"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
