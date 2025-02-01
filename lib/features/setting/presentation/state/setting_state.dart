import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  factory SettingState({
    @Default(false) bool isDarkMode,
    @Default(false) bool isLoading,
  }) = _SettingState;
}
