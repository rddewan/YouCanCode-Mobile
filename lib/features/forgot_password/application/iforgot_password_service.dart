

import 'package:youcancode/features/forgot_password/data/dto/request/forgot_password_request.dart';

abstract interface class IForgotPasswordService {
  Future<bool> forgotPassword(ForgotPasswordRequest data);
}