

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/features/signup/application/isign_up_service.dart';
import 'package:youcancode/features/signup/data/dto/request/sign_up_request.dart';
import 'package:youcancode/features/signup/data/dto/response/sign_up_response.dart';
import 'package:youcancode/features/signup/data/repository/isign_up_repository.dart';
import 'package:youcancode/features/signup/data/repository/sign_up_repository.dart';
import 'package:youcancode/features/signup/domain/mapper/isign_up_model_mapper.dart';
import 'package:youcancode/features/signup/domain/model/sign_up_model.dart';

final signUpServiceProvider = Provider.autoDispose<ISignUpService>((ref) {
  final signUpRepository = ref.watch(signUpRepositoryProvider);

  return SignUpService(signUpRepository);

});

final class SignUpService implements ISignUpService, ISignUpModelMapper {
  final ISignUpRepository _signUpRepository;

  SignUpService(this._signUpRepository);

  @override
  Future<SignUpModel> signUp(SignUpRequest data) async {
    try {

      final response = await _signUpRepository.signUp(data);

      final model = mapToSignUpModel(response);

      return model;
      
    } catch (e) {
      rethrow;
    }
  }

  @override
  SignUpModel mapToSignUpModel(SignUpResponse response) {
    final user = response.data.user;

    return SignUpModel(
      name: user.name,
      email: user.email,
      isSugnUpSuccess: true,
    );
  }
  
}