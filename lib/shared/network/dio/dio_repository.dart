import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/feature/auth/repository/token_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioRepositoryProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json'
      },
    ),
  )
    /*..interceptors.add(InterceptorsWrapper(
      onError: (DioError e, ErrorInterceptorHandler handler) {
        final errorTimeout = [DioErrorType.receiveTimeout].contains(e.type);

        return handler.next(e);
      },
    ))*/
    ..options.validateStatus = (int? status) => true;

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) async {
        late final tokenRepository = ref.read(tokenRepositoryProvider);
        final appToken = await tokenRepository.fetchToken();
        if (appToken != null) {
          options.headers['Authorization'] = 'Bearer ${appToken.token}';
          return handler.next(options);
        }

        return handler.next(options);
      },
    ),
  );
  if (kDebugMode) {
    final logger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      maxWidth: 180,
    );
    dio.interceptors.add(logger);
  }
  return dio;
});
