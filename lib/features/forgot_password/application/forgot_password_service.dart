

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/features/forgot_password/application/iforgot_password_service.dart';
import 'package:youcancode/features/forgot_password/data/dto/request/forgot_password_request.dart';
import 'package:youcancode/features/forgot_password/data/repository/forgot_password_repository.dart';
import 'package:youcancode/features/forgot_password/data/repository/iforgot_password_repository.dart';

final forgotPasswordServiceProvider = Provider.autoDispose<IForgotPasswordService>((ref) {
  final forgotPasswordRepository = ref.watch(forgotPasswordRepositoryProvider);

  return ForgotPasswordService(forgotPasswordRepository);
});

final class ForgotPasswordService implements IForgotPasswordService {
  final IForgotPasswordRepository _forgotPasswordRepository;

  ForgotPasswordService(this._forgotPasswordRepository);

  @override
  Future<bool> forgotPassword(ForgotPasswordRequest data) async {
    try {
      final response = await _forgotPasswordRepository.forgotPassword(data);

      return response.data.emailSent;
      
    } catch (_) {
      rethrow;
    }
  }

}