import 'package:youcancode/features/forgot_password/data/dto/request/forgot_password_request.dart';
import 'package:youcancode/features/forgot_password/data/dto/response/forgot_password_response.dart';

abstract interface class IForgotPasswordRepository {
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest data);
}
