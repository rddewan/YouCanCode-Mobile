


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/features/forgot_password/data/dto/request/forgot_password_request.dart';
import 'package:youcancode/features/forgot_password/data/dto/response/forgot_password_response.dart';
import 'package:youcancode/features/forgot_password/data/repository/iforgot_password_repository.dart';
import 'package:youcancode/features/forgot_password/data/source/remote/forgot_password_api.dart';

final forgotPasswordRepositoryProvider = Provider.autoDispose<IForgotPasswordRepository>((ref) {
  final forgotPasswordApi = ref.watch(forgotPasswordApiProvider);

  return ForgotPasswordRepository(forgotPasswordApi);

});

final class ForgotPasswordRepository implements IForgotPasswordRepository {
  final ForgotPasswordApi _forgotPasswordApi;

  ForgotPasswordRepository(this._forgotPasswordApi);

  @override
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest data) async {

    try {

     return  await _forgotPasswordApi.forgotPassword(data);
      
    } catch (_) {
      rethrow;
      
    }
    
  }
}