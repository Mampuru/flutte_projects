import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_config/api_key.dart';

class ChatService {
  static final Uri chatUri = Uri.parse('https://api.openai.com/v1/chat/completions');

  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${ApiKey.openAIApiKey}',
  };

  Future<String?> request() async {
    String prompt = "Where are the places to visit in Istanbul?";
    try {
      var response = await http.post(
        chatUri,
        headers: headers,
        body: {},
      );
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
    }
  }
}