import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

InterceptorsWrapper stubForTest(Map<String, dynamic> map,
    {Duration duration = Duration.zero}) {
  return InterceptorsWrapper(onRequest: (options, handler) async {
    dynamic response = map[options.path][options.method];
    if (response != null) {
      if (kDebugMode) {
        print('Response found for ${options.method} ${options.path}');
      }
      await Future.delayed(duration);
      return handler.resolve(Response(
          statusCode: response['status'],
          data: response['data'] != null ? json.decode(response['data']) : null,
          requestOptions: options));
    }
    if (kDebugMode) {
      print('No response found for ${options.method} ${options.path}');
    }
    return handler.next(options);
  });
}
