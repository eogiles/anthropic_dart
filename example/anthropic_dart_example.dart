import 'package:anthropic_dart/anthropic_dart.dart';

Future<void> main() async {
  String key = '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';
  final String defaultModel = "claude-3-opus-20240229";

  var service = AnthropicService(key, model: defaultModel);
  print('\n\nEXAMPLE: 🍎🍎🍎 ... sending hello request to 🍎AnthropicService');

  var helloResponse = await service.sendHello();
  print('\n\nEXAMPLE: 🍎🍎🍎 ${helloResponse.toJson()} 🍎🍎🍎');

  //wait for a few seconds for quota and rate limit reasons
  await Future.delayed(Duration(seconds: 5));

  print('\n\nEXAMPLE: 🍎🍎🍎 ... sending text request to 🍎AnthropicService');

  var request = Request();
  request.model = defaultModel;
  request.maxTokens = 1024;
  request.messages = [
    Message(role: 'user', content: 'Help me cook lasagna'),
  ];
  var response = await service.sendRequest(request: request);
  print('\n\nEXAMPLE: 🍎🍎🍎 ${response.toJson()} 🍎🍎🍎');

  //
  // var request2 = RequestWithImages();
  // // ... set parameters ... see class RequestWithImages
  // var requestWithImages = await service.sendRequestWithImages(
  //     request: request2);


}
