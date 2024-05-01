import 'package:flutter_dotenv/flutter_dotenv.dart';

String loadFromEnv(String key) {
  return dotenv.env[key] ?? '';
}
