import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = NotifierProvider<AuthState, bool>(AuthState.new);

class AuthState extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void setAuthState(bool value) {
    state = value;
  }
}
