import 'package:multiple_result/multiple_result.dart';
import 'package:youcancode/common/exception/failure.dart';
import 'package:youcancode/features/login/data/dto/request/login_request.dart';

abstract interface class ILoginService {
  Future<Result<bool, Failure>> login(LoginRequest loginRequest);
}
