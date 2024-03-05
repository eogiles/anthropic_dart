
import 'package:anthropic_dart/src/data/request.dart';
import 'package:anthropic_dart/src/data/response.dart';
import 'package:anthropic_dart/src/data2/request_with_images.dart';
import 'package:anthropic_dart/src/service/dio_util.dart';
import 'package:dio/dio.dart' as du;

class AnthropicService {
  final String apiKey;
  final String? model;

  late DioUtil dioUtil;

  final String defaultModel = "claude-3-opus-20240229";

  AnthropicService(this.apiKey, {this.model}) {
    dioUtil = DioUtil(du.Dio());
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
          Message(role: 'user', content: 'Hello!'),
          Message(
              role: 'assistant',
              content: 'I am Anthropic, the super Assistant!')
        ]);
    return _sendRequest(req, debug: true);
  }

  Future<Response> sendRequest({required Request request, bool? debug}) async {
    request.model ??= defaultModel;
    request.maxTokens ??= 1024;
    return _sendRequest(request, debug: debug);
  }

  Future<Response> sendRequestWithImages(
      {required RequestWithImages request, bool? debug}) async {
    request.model ??= defaultModel;
    request.maxTokens ??= 1024;
    return _sendRequest(request, debug: debug);
  }

  Future<Response> _sendRequest(dynamic body, {bool? debug}) async {
    if (debug != null && debug) {
      print('AnthropicService: 🍎🍎🍎sending Request ...');
    }

    late Response response;
    var headers = {
      'anthropic-version': '2023-06-01',
      'x-api-key': apiKey,
      'content-type': 'application/json',
    };
    try {
      var mJson = await dioUtil.sendPostRequest(
          body: body.toJson(), headers: headers, debug: debug);
      if (debug != null && debug) {
        print('🍎AnthropicService sendRequest response: 🍎$mJson 🍎');
      }
      response = Response.fromJson(mJson);
    } catch (e, s) {
      print('🍎ERROR: $e - $s');
      throw Exception('Anthropic ERROR: $e');
    }
    return response;
  }
}