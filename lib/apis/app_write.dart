import 'dart:developer';

import 'package:ai_chat/helper/global.dart';
import 'package:appwrite/appwrite.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);
  static void init() {
    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('664cf48b00257feb2211')
        .setSelfSigned(status: true);
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
          databaseId: 'FlutterDatabase',
          collectionId: 'ApiKey',
          documentId: 'gptKey');

      apiKey = d.data['apiKey'];
      log(apiKey);
      return apiKey;
    } catch (e) {
      log('$e');
      return '';
    }
  }
}
