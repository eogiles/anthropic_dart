import 'package:claude_dart_flutter/claude_dart_flutter.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = ClaudeService('apiKey');

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.apiKey, 'apiKey');
    });
  });
}
