import 'dart:convert';

import 'package:englifyar/core/rahasia/rahasia.dart';
import 'package:http/http.dart' as http;

class OpenaiService {
  Future<String> gptPrompt() async {
    try {
      final res = await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppSecret.apiKeyGPT}",
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "user",
                "content":
                    "Hey, I need help creating a detailed plan for a project. Can you help me?"
              }
            ]
          },
        ),
      );

      final data = json.decode(res.body);

      // Check if there is an error in the response
      if (data.containsKey("error")) {
        print("API Error: ${data["error"]["message"]}");
        return "Error: ${data["error"]["message"]}";
      }

      return data["choices"][0]["message"]["content"];
    } catch (e) {
      print("Error fetching GPT prompt: $e");
      return "Error fetching GPT prompt";
    }
  }
}
