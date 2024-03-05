import 'package:anthropic_dart/anthropic_dart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = AnthropicService('apiKey');

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.apiKey, 'apiKey');
    });
  });
}
