import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://www.breakingbadapi.com",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(url,
        queryParameters: query,
        options: Options(
            contentType: 'application/json',
            followRedirects: false,
            validateStatus: (state) {
              return state! < 500;
            }));
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    // var formData = FormData.fromMap(query);
    return await dio.post(url,
        data: query,
        options: Options(
            contentType: 'application/json',
            followRedirects: false,
            validateStatus: (state) {
              return state! < 500;
            }));
  }
}
