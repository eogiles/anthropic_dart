import 'package:dio/dio.dart';

class DioUtil {
  final Dio dio;
  static const mm = '🥬🥬🥬🥬 DioUtil 🥬';

  DioUtil(this.dio);

  static const urlPrefix = 'https://api.anthropic.com/v1/messages';


  Future<dynamic> sendPostRequest(
      {required dynamic body, required dynamic headers, bool? debug}) async {
    print('$mm 🍎🍎🍎🍎🍎 Dio sendPostRequest ... 🍎🍎🍎🍎🍎');
    try {
      Response response;
      response = await dio
          .post(
            urlPrefix,
            data: body,
            options: Options(
                headers: headers,
                responseType: ResponseType.json),
            onReceiveProgress: (count, total) {
              print('$mm onReceiveProgress: count: $count total: $total');
            },
            onSendProgress: (count, total) {
              print('$mm onSendProgress: count: $count total: $total');
            },
          )
          .timeout(const Duration(seconds: 300));
      print(
          '$mm .... network POST response, 💚status code: ${response.statusCode} 💚💚');
      return response.data;
    } catch (e) {
      print('$mm .... network POST error response, '
          '👿👿👿👿 $e 👿👿👿👿');
      print(e);
      rethrow;
    }
  }
}
