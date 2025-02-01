import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/core/provider/auth_state_provider.dart';
import 'package:youcancode/features/setting/application/setting_service.dart';
import 'package:youcancode/features/setting/presentation/state/setting_state.dart';

final settingControllerProvider =
    NotifierProvider<SettingController, SettingState>(SettingController.new);

class SettingController extends Notifier<SettingState> {
  @override
  SettingState build() {
    return SettingState();
  }

  Future<void> clearToken() async {
    // clear token - access token and refresh token
    await ref.read(settingServiceProvider).clearToken();
    // set auth state - false
    ref.read(authStateProvider.notifier).setAuthState(false);
  }
}
