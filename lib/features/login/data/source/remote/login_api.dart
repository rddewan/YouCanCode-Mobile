

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youcancode/features/login/data/dto/request/login_request.dart';
import 'package:youcancode/features/login/data/dto/response/login_response.dart';

part 'login_api.g.dart';

@RestApi()
abstract class  LoginApi {
  factory LoginApi(Dio dio) => _LoginApi(dio);

  @POST('/api/v1/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
  
}