import 'dart:convert';
import 'package:englifyar/core/rahasia/rahasia.dart';
import 'package:http/http.dart' as http;

class GeminiService {
  String? currentConversation;
  final String apiKey = AppSecret.apiKeyGemini;

  Future<String> geminiPrompt() async {
    if (apiKey.isEmpty) return "API key missing. Check configuration";

    final Uri url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  "text":
                      "You are a virtual assistant for elementary students make conversation about stu. Answer briefly. Reply 'yes' if you understand."
                }
              ]
            }
          ]
        }),
      );

      final Map<String, dynamic> data = jsonDecode(response.body);
      String? responseText =
          data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"];
      return responseText?.trim() ?? "Unexpected response format.";
    } catch (e) {
      return "Error occurred: $e";
    }
  }

  Future<String> userPrompt(String userInput) async {
    if (apiKey.isEmpty) return "API key missing.";
    if (userInput.isEmpty) return "Enter a question.";

    currentConversation ?? "";
    currentConversation ?? "\nUser: $userInput";

    String aiResponse = await _sendRequest(currentConversation.toString());
    String suggestion = await _getSuggestions(aiResponse);

    currentConversation ?? "\nAI: $aiResponse";

    String shortResponse = aiResponse.split(" ").take(10).join(" ");
    String shortSuggestion = suggestion.split(" ").take(14).join(" ");

    return "Response: $shortResponse\nSuggestion: $shortSuggestion";
  }

  Future<String> _getSuggestions(String aiResponse) async {
    return await _sendRequest(
        "Give a suggestion based on this response: $aiResponse");
  }

  Future<String> _sendRequest(String prompt) async {
    final Uri url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        }),
      );

      final Map<String, dynamic> data = jsonDecode(response.body);
      String? responseText =
          data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"];
      return responseText?.trim() ?? "Unexpected response format.";
    } catch (e) {
      return "Error occurred: $e";
    }
  }
}
