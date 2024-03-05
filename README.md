# Dart Anthropic API Package

This Dart package provides idiomatic access to the Anthropic AI API for both Dart and Flutter applications. 
Anthropic AI is a powerful platform for artificial intelligence and machine learning tasks, and this package simplifies integration with your Dart and Flutter projects.    

The package hides the messy details of the Anthropic REST API and lets you work with nice statically typed Dart classes.  

- **Request**
- **RequestWithImages**
- **Response**
- **AnthropicService**


## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  anthropic_dart: ^1.0.1
```

Then, run:

```bash
$ flutter pub get
```

## Usage

Import the package where you need to use it:

```dart
import 'package:anthropic_dart/anthropic_dart.dart';
```

Initialize the Anthropic API client with your API key:

```dart
final service = AnthropicService(apiKey: 'your_api_key');
```

Now you can use the various methods provided by the Anthropic API. For example:  

Send a request to the Anthropic completions endpoint.

```dart
var request = Request();
final Response response = await service.sendRequest(request); 
```
```
Send a request to the Anthropic text and image completions endpoint.

```dart
var request = RequestWithImages();
final Response response = await service.sendRequestWithImages(request); 
```


A quick way to check whether things are cool is by sending a Hello request to the Anthropic Chat Completions endpoint.   

```dart
final List<Response> response = await service.sendHello(); 
```

## Authentication

You need an API key from Anthropic AI to use this package. Get registered and get an API key here: [Anthropic AI Website](https://www.anthropic.com/)  

## Example

You can find a simple example in the [example](example) directory of this repository.

## Issues and Feedback

Please file any issues, bugs, or feature requests in the [issue tracker](https://github.com/malengatiger/anthropic_dart/issues).

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.