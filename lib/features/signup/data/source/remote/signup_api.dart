import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youcancode/features/signup/data/dto/request/sign_up_request.dart';
import 'package:youcancode/features/signup/data/dto/response/sign_up_response.dart';

part 'signup_api.g.dart';

@RestApi()
abstract class SignUpApi {
  factory SignUpApi(Dio dio) => _SignUpApi(dio);

  @POST('/api/v1/auth/signup')
  Future<SignUpResponse> signUp(@Body() SignUpRequest data);

}