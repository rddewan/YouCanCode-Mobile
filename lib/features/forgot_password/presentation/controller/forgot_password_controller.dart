import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/features/forgot_password/application/forgot_password_service.dart';
import 'package:youcancode/features/forgot_password/data/dto/request/forgot_password_request.dart';
import 'package:youcancode/features/forgot_password/presentation/state/forgot_password_state.dart';

final forgotPasswordControllerProvider =
    NotifierProvider<ForgotPasswordController, ForgotPasswordState>(
        ForgotPasswordController.new);

class ForgotPasswordController extends Notifier<ForgotPasswordState> {
  @override
  ForgotPasswordState build() {
    return ForgotPasswordState();
  }

  /// Sends a forgot password request with the given email.
  ///
  /// This method initiates the forgot password process by sending a request to
  /// the service with the provided email address. It updates the state to
  /// indicate a loading status while the request is in progress. If the request
  /// is successful, it updates the state to reflect that the email has been sent.
  /// In case of an error, it captures the error and updates the state with the
  /// error message.
  ///
  /// Parameters:
  ///   - [email]: The email address to send the forgot password request to.
  ///
  /// Returns:
  ///   A [Future] that completes when the operation is finished.
  Future<void> forgotPassword(String email) async {
    try {
      // update the state - isLoading = true and error = null
      state = state.copyWith(isLoading: true, error: null);
      // set the request - email from the parameter
      final data = ForgotPasswordRequest(email: email);
      // call the service
      final result =
          await ref.read(forgotPasswordServiceProvider).forgotPassword(data);

      result.when(
        (success) {
          // update the state - isLoading = false and isEmailSent = result
          state = state.copyWith(isLoading: false, isEmailSent: success);
        },
        (failure) {
          state = state.copyWith(isLoading: false, error: failure.message);
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
