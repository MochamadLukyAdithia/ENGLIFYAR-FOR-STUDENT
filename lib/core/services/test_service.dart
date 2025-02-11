import 'package:englifyar/core/services/gemini_service.dart';
import 'package:flutter/material.dart';

class TestService extends StatefulWidget {
  const TestService({super.key});

  @override
  State<TestService> createState() => _TestServiceState();
}

class _TestServiceState extends State<TestService> {
  final TextEditingController messageController = TextEditingController();
  final GeminiService geminiService = GeminiService();
  Future<String>? responseFuture;
  String suggestion = '';

  void sendMessage() {
    final message = messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        responseFuture = geminiService.userPrompt(message).then((response) {
          final parts = response.split("\n\nSuggestion:");
          suggestion = parts.length > 1 ? parts[1].trim() : '';
          return parts[0].trim();
        });
        messageController.clear();
      });
    }
  }

  void refreshPage() {
    setState(() {
      responseFuture = null;
      suggestion = '';
      messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Warna latar belakang yang lebih cerah
      appBar: AppBar(
        title: const Text("AI Chat",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        elevation: 3,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: refreshPage,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<String>(
                future: responseFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(color: Colors.blueAccent),
                          SizedBox(height: 10),
                          Text("AI sedang berpikir...",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text("Error: ${snapshot.error}",
                            style: const TextStyle(color: Colors.red)));
                  } else if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _chatBubble(snapshot.data ?? "Tidak ada respons",
                              isAI: true),
                          if (suggestion.isNotEmpty)
                            _chatBubble("💡 Saran: $suggestion",
                                isAI: true, isSuggestion: true),
                        ],
                      ),
                    );
                  } else {
                    return _chatBubble("👋 Hai Luky! Mau belajar apa hari ini?",
                        isAI: true);
                  }
                },
              ),
            ),
            _inputArea(),
          ],
        ),
      ),
    );
  }

  Widget _chatBubble(String text,
      {required bool isAI, bool isSuggestion = false}) {
    return Align(
      alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isAI
              ? (isSuggestion ? Colors.yellow[200] : Colors.blueAccent)
              : Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _inputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Ketik pesan...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: sendMessage,
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
