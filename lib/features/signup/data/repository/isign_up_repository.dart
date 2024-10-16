

import 'package:youcancode/features/signup/data/dto/request/sign_up_request.dart';
import 'package:youcancode/features/signup/data/dto/response/sign_up_response.dart';

abstract interface class ISignUpRepository {
  
  Future<SignUpResponse> signUp(SignUpRequest data);
}