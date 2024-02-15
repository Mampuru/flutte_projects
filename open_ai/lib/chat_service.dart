import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_config/api_key.dart';
import 'models/message_model.dart';
import 'models/request_model.dart';
import 'models/response_model.dart';

class ChatService {
  static final Uri chatUri = Uri.parse('https://api.openai.com/v1/chat/completions');

  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${ApiKey.openAIApiKey}',
  };

  Future<String?> request(String prompt) async {
    try {
      ChatRequest request = ChatRequest(model: "gpt-3.5-turbo",
          maxTokens: 150,
          messages: [Message(role: "system", content: prompt)]);
      if (prompt.isEmpty) {
        return null;
      }
      http.Response response = await http.post(
        chatUri,
        headers: headers,
        body: request.toJson(),
      );
      ChatResponse chatResponse = ChatResponse.fromResponse(response);
      if (kDebugMode) {
        print(chatResponse.choices?[0].message?.content);
      }
      return chatResponse.choices?[0].message?.content;
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
    }
    return null;
  }
}