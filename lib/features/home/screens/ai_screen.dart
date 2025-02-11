import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class AiConversationScreen extends StatefulWidget {
  const AiConversationScreen({super.key});

  @override
  State<AiConversationScreen> createState() => _AiConversationScreenState();
}

class _AiConversationScreenState extends State<AiConversationScreen> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _isListening = false;
  String _lastWords = 'Belum ada hasil suara.';
  String _statusMessage = 'Tekan tombol mikrofon untuk mulai berbicara.';

  @override
  void initState() {
    super.initState();
    _checkPermissions();
    _initSpeech();
  }

  /// Periksa izin mikrofon
  void _checkPermissions() async {
    bool hasPermission = await _speechToText.hasPermission;
    if (!hasPermission) {
      print("❌ Izin mikrofon belum diberikan");
    }
  }

  /// Inisialisasi SpeechToText
  void _initSpeech() async {
    bool available = await _speechToText.initialize(
      onError: (error) => print("⚠️ Kesalahan Pengenalan Suara: $error"),
      onStatus: (status) {
        print("ℹ️ Status Pengenalan Suara: $status");
        setState(() {
          _statusMessage = status == "listening"
              ? "Mendengarkan... Silakan berbicara!"
              : "Tekan tombol mikrofon untuk mulai berbicara.";
        });
      },
    );

    setState(() {
      _speechEnabled = available;
    });
  }

  /// Mulai mendengarkan suara
  void _startListening() async {
    if (!_speechEnabled) return;

    await _speechToText
        .listen(
      onResult: _onSpeechResult,
      listenFor: Duration(seconds: 60), // Tingkatkan durasi pendengaran
      pauseFor: Duration(seconds: 10), // Tambahkan waktu jeda sebelum berhenti
      localeId: "id_ID", // Menggunakan Bahasa Indonesia
      onSoundLevelChange: (level) => print("🎤 Tingkat suara: $level"),
      cancelOnError: true,
    )
        .catchError((error) {
      print("❌ Kesalahan saat mendengarkan: $error");
    });

    setState(() {
      _isListening = true;
      _statusMessage = "Mendengarkan...";
    });
  }

  /// Berhenti mendengarkan
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
      _statusMessage = "Tekan tombol mikrofon untuk mulai berbicara.";
    });
  }

  /// Proses hasil pengenalan suara
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords.isNotEmpty
          ? result.recognizedWords
          : "Tidak ada kata yang dikenali.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengenalan Suara (ID)'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hasil Pengenalan Suara:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _lastWords,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _statusMessage,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isListening ? _stopListening : _startListening,
        tooltip: 'Dengar',
        child: Icon(_isListening ? Icons.mic : Icons.mic_off),
      ),
    );
  }
}
