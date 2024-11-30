

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:youcancode/common/exception/failure.dart';
import 'package:youcancode/features/login/application/ilogin_service.dart';
import 'package:youcancode/features/login/data/dto/request/login_request.dart';
import 'package:youcancode/features/login/data/repository/ilogin_repository.dart';
import 'package:youcancode/features/login/data/repository/login_repository.dart';

final loginServiceProvider = Provider.autoDispose<ILoginService>((ref) {
  final loginRepository = ref.watch(loginRepositoryProvider);

  return LoginService(loginRepository);

});


final class LoginService implements ILoginService {
  final ILoginRepository _loginRepository;

  LoginService(this._loginRepository);

  @override
  Future<Result<bool, Failure>> login(LoginRequest loginRequest) async {
    try {

      await _loginRepository.login(loginRequest);

      return const Success(true);
      
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(
        Failure(
          message: e.toString(),
          exception: e as Exception,
          stackTrace: s,
        )
      );
      
    }
  }

}