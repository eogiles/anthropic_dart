
import 'package:claude_dart_flutter/src/data/request.dart';
import 'package:claude_dart_flutter/src/data/response.dart';
import 'package:claude_dart_flutter/src/data2/request_with_images.dart';
import 'package:claude_dart_flutter/src/service/http_util.dart';
import 'package:claude_dart_flutter/src/service/dio_util.dart';
import 'package:dio/dio.dart' as du;

class ClaudeService {
  final String apiKey;
  final String? model;

  late DioUtil dioUtil;
  late HttpUtil httpUtil;

  final String defaultModel = "claude-3-haiku-20240307";

  ClaudeService(this.apiKey, {this.model}) {
    dioUtil = DioUtil(du.Dio());
    httpUtil = HttpUtil();
  }

  Future<Response> sendHello() async {
    try {
      print('...............🍎🍎🍎 Sending Hello, '
          'model: $model, apiKey: $apiKey');
    } catch (e, s) {
      print(s);
    }
    var req = Request(
        model: model == null ? defaultModel : model!,
        maxTokens: 1024,
        messages: [
          Message(role: 'user', content: 'Hello Anthropic!'),
        ]);
    return _sendRequestToAnthropic(req.toJson(), debug: true);
  }

  Future<Response> sendRequest({required Request request, bool? debug}) async {
    request.model ??= defaultModel;
    request.maxTokens ??= 1024;
    return _sendRequestToAnthropic(request.toJson(), debug: debug);
  }

  Future<Response> sendRequestWithImages(
      {required RequestWithImages request, bool? debug}) async {
    request.model ??= defaultModel;
    request.maxTokens ??= 1024;
    return _sendRequestToAnthropic(request.toJson(), debug: debug);
  }

  Future<Response> _sendRequestToAnthropic(dynamic body, {bool? debug}) async {

    late Response response;
    var headers = {
      'anthropic-version': '2023-06-01',
      'x-api-key': apiKey,
      'content-type': 'application/json',
    };
    if (debug != null && debug) {
      print('AnthropicService: 🍎🍎sending Request ... \n🍎headers $headers \n🍎body $body');
    }
    try {
      // var mJson = await httpUtil.postRequest(
      //     body: body, headers: headers, debug: debug);
      du.Response res = await dioUtil.sendPostRequest(
          body: body.toJson(), headers: headers, debug: debug);
      if (debug != null && debug) {
        print('🍎AnthropicService sendRequest response: 🍎${res.statusCode} 🍎');
        print(res.data);
      }
      if (res.statusCode == 200 || res.statusCode == 201) {
        response = Response.fromJson(res.data);
        if (debug != null && debug) {
          print('AnthropicService: 🍎🍎response data: ${res.data}');
        }
      } else {
        print('🍎AnthropicService BAD RESPONSE: statusCode:${res.statusCode}');
        print(res.data);
        throw Exception('Anthropic ERROR: ${res.statusCode} ${res.statusMessage}');
      }

    } catch (e, s) {
      print('🍎ERROR: $e - $s');
      throw Exception('Anthropic ERROR: $e');
    }
    return response;
  }
}