import 'package:dio/dio.dart';

class ApiRepository {
  final String baseUrl;
  final Map<String, dynamic>? body, params;
  final Options? options;

  ApiRepository({required this.baseUrl, this.body, this.options, this.params});

  final _dio = Dio();

  get(
      {Function? beforeSend,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) {
    _dio
        .get(baseUrl, options: options, queryParameters: params)
        .then((response) {
      if (beforeSend != null) {
        beforeSend();
      }
      if (onSuccess != null) {
        if (response.statusCode == 200) {
          onSuccess(response.data);
        }
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }

  post(
      {Function? beforeSend,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) {
    _dio
        .post(baseUrl, data: body, options: options, queryParameters: params)
        .then((response) {
      if (beforeSend != null) {
        beforeSend();
      }
      if (onSuccess != null) {
        if (response.statusCode == 200) {
          onSuccess(response.data);
        }
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
