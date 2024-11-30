

import 'package:multiple_result/multiple_result.dart';
import 'package:youcancode/common/exception/failure.dart';
import 'package:youcancode/features/forgot_password/data/dto/request/forgot_password_request.dart';

abstract interface class IForgotPasswordService {
  Future<Result<bool, Failure>> forgotPassword(ForgotPasswordRequest data);
}