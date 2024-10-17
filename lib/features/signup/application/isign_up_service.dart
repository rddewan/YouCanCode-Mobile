

import 'package:youcancode/features/signup/data/dto/request/sign_up_request.dart';
import 'package:youcancode/features/signup/domain/model/sign_up_model.dart';

abstract interface class ISignUpService {

  Future<SignUpModel> signUp(SignUpRequest data);
  
}