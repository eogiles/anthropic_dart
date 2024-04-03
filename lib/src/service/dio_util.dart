import 'package:dio/dio.dart';

class DioUtil {
  final Dio dio;
  static const mm = '🥬🥬🥬🥬 DioUtil 🥬';

  DioUtil(this.dio);

  static const urlPrefix = 'https://api.anthropic.com/v1/messages';

  Future<Response> sendPostRequest(
      {required dynamic body, required dynamic headers, bool? debug}) async {
    if (debug != null && debug) {
      print('$mm 🍎🍎🍎🍎🍎 Dio sendPostRequest ... 🍎🍎🍎🍎🍎');
    }
    try {
      Response response;
      response = await dio.post(
        urlPrefix,
        data: body,
        options: Options(headers: headers, responseType: ResponseType.json),
        onReceiveProgress: (count, total) {
          if (debug != null && debug) {
            print('$mm onReceiveProgress: count: $count total: $total');
          }
        },

      ).timeout(const Duration(seconds: 300));
      if (debug != null && debug) {
        print(
            '$mm .... network POST response, 💚status code: ${response.statusCode} 💚💚');
        print('${response.data}');
      }

      return response;
    } catch (e, s) {
      print('$mm .... network POST error response, '
          '👿👿👿👿 $e 👿👿👿👿');
      print('$s');
      rethrow;
    }
  }
}
