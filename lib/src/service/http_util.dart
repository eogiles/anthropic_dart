import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpUtil {

  final http.Client client = http.Client();
  static const mm = '🥬🥬🥬🥬 HttpUtil 🥬';
  static const urlPrefix = 'https://api.anthropic.com/v1/messages';

  Future postRequest({required dynamic body, required dynamic headers, bool? debug}) async{
    if (debug != null && debug) {
      print('$mm 🍎🍎🍎🍎🍎 sendPostRequest ... 🍎🍎🍎🍎🍎');
    }
    var url = Uri.parse(urlPrefix);
    try {
      final msg  = jsonEncode(body);
      var response = await http.post(url, body: msg, headers: headers);
      if (debug != null && debug) {
        print('$mm Response status: ${response.statusCode}');
        print('$mm Response body: ${response.body}');
      }
      return response.body;
    } catch (error, stackTrace) {
      print('$mm Error: $error');
      print('$mm Stack Trace: $stackTrace');
    }
  }
}
