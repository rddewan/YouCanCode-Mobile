import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/features/signup/application/sign_up_service.dart';
import 'package:youcancode/features/signup/data/dto/request/sign_up_request.dart';
import 'package:youcancode/features/signup/presentation/state/sign_up_state.dart';

final signUpControllerProvider =
    AutoDisposeNotifierProvider<SignUpController, SignUpState>(
        SignUpController.new);

class SignUpController extends AutoDisposeNotifier<SignUpState> {
  @override
  SignUpState build() {
    return SignUpState();
  }

  Future<void> signUp() async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        isSignUpSuccess: null,
      );

      final formData = SignUpRequest(
        name: state.signUpform['name'],
        email: state.signUpform['email'],
        password: state.signUpform['password'],
        passwordConfirm: state.signUpform['passwordConfirm'],
      );

      final result = await ref.read(signUpServiceProvider).signUp(formData);
      result.when((success) {
        state = state.copyWith(
          isLoading: false,
          isSignUpSuccess: success.isSugnUpSuccess,
          signUpModel: success,
        );
      }, (failure) {
        state = state.copyWith(
          isLoading: false,
          isSignUpSuccess: null,
          error: failure.message,
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSignUpSuccess: null,
        error: e.toString(),
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      signUpform: formData,
    );
  }
}
