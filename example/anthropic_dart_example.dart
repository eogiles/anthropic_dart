import 'dart:io';

import 'package:claude_dart_flutter/claude_dart_flutter.dart';


Future<void> main() async {
  String key = '<api-key>';

  final String defaultModel = "claude-3-opus-20240229";
  const mm = '🍎🍎🍎';
  String apiKey = String.fromEnvironment('apiKey', defaultValue: key);

  print('$mm apiKey: $apiKey');
  var service = ClaudeService(apiKey, model: defaultModel);
  print('\n\nEXAMPLE: $mm ... sending hello request to 🍎AnthropicService');

  try {
    var helloResponse = await service.sendHello();
    print('\n\nEXAMPLE: hello response $mm ${helloResponse.toJson()} $mm');
  } catch (e) {
    print(e);
  }

  print(' 🔵wait for a few seconds for quota and rate limit reasons ...');
  await Future.delayed(Duration(seconds: 5));

  print('\n\nEXAMPLE: $mm ... sending text request to 🍎AnthropicService');

  try {
    var request = Request(
      model: defaultModel,
      maxTokens: 1024,
      messages: [
        Message(
            role: 'user', content: 'Help me make a Greek salad'),
      ],
    );

    var response = await service.sendRequest(request: request);
    print('\n\nEXAMPLE: sendRequest response $mm ${response.toJson()} $mm');
  } catch (e) {
    print(e);
  }

  print(' 🔵wait for a few seconds for quota and rate limit reasons ...');
  await Future.delayed(Duration(seconds: 10));
  //
  try {
    // Get the current directory
    var currentDirectory = Directory.current;

    // Create a File object with the file name
    var file = File('${currentDirectory.path}/example/beHappy.png');
    print(
        '$mm file size: ${await file.length() / 1024}K bytes; keep it under 5 MB');
    MessageWithImages msg = MessageWithImages(role: 'user', content: [
      ContentWithImage(
          type: 'image',
          source: Source(
              type: 'base64',
              mediaType: 'image/png',
              data: file.readAsBytesSync())),
      Content(type: 'text', text: 'Describe what is in the image'),
    ]);

    //send request with a base64 image from the local file in the example folder
    var requestWithImage = RequestWithImages(
        model: defaultModel, maxTokens: 2400, messages: [msg]);
    var responseImages =
        await service.sendRequestWithImages(request: requestWithImage);
    print(
        '\n\nEXAMPLE: requestWithImage response $mm ${responseImages.toJson()} $mm');
  } catch (e,s) {
    print('$mm 👿👿ERROR: $e 👿👿 $s 👿👿' );
  }
}
