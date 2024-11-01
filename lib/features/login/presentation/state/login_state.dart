

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {

  factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoginSuccess,
    String? error,
    @Default({}) Map<String, dynamic> loginForm
  }) = _LoginState;

}