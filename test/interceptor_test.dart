import 'dart:convert';

import 'package:dio/dio.dart';

InterceptorsWrapper stubForTest(Map<String, dynamic> map,
    {Duration duration = Duration.zero}) {
  return InterceptorsWrapper(onRequest: (options, handler) async {
    dynamic response = map[options.path][options.method];
    if (response != null) {
      print(options.method);
      print(options.path);
      await Future.delayed(duration);
      return handler.resolve(Response(
          statusCode: response['status'],
          data: response['data'] != null ? json.decode(response['data']) : null,
          requestOptions: options));
    }
    return handler.next(options);
  });
}