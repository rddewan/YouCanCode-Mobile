import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/common/exception/failure.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';
import 'package:youcancode/common/mixin/dio_exception_mapper.dart';
import 'package:youcancode/features/signup/data/dto/request/sign_up_request.dart';
import 'package:youcancode/features/signup/data/dto/response/sign_up_response.dart';
import 'package:youcancode/features/signup/data/repository/isign_up_repository.dart';
import 'package:youcancode/features/signup/data/source/remote/signup_api.dart';

final signUpRepositoryProvider = Provider.autoDispose<ISignUpRepository>((ref) {
  final signUpApi = ref.watch(signUpApiProvider);

  return SignUpRepository(signUpApi);
});

final class SignUpRepository
    with DioExceptionMapper
    implements ISignUpRepository {
  final SignUpApi _signUpApi;

  SignUpRepository(this._signUpApi);

  @override
  Future<SignUpResponse> signUp(SignUpRequest data) async {
    try {
      final response = await _signUpApi.signUp(data);

      return response;
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message:
            "An unexpected error occurred. Please try again later".hardcoded,
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
