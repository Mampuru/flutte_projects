import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKey{
  static String? openAIApiKey = dotenv.env['API_KEY'];
}