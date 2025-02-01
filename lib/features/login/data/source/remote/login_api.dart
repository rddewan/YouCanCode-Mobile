import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youcancode/core/data/remote/endpoint.dart';
import 'package:youcancode/core/data/remote/network_service.dart';
import 'package:youcancode/features/login/data/dto/request/login_request.dart';
import 'package:youcancode/features/login/data/dto/response/login_response.dart';

part 'login_api.g.dart';

final loginApiProvider = Provider.autoDispose<LoginApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return LoginApi(dio);
});

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio) => _LoginApi(dio);

  @POST(loginEndPoint)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
