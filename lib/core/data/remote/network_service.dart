import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/core/data/remote/base_url.dart';
import 'package:youcancode/core/data/remote/network_service_interceptor.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: baseURL,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
  );

  final dio = Dio(options);
  final networkServiceInterceptor =
      ref.watch(networkServiceInterceptorProvider(dio));

  dio.interceptors.addAll([
    HttpFormatter(),
    networkServiceInterceptor,
  ]);

  return dio;
});
