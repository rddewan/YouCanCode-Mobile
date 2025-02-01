import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_response.freezed.dart';
part 'forgot_password_response.g.dart';

@freezed
class ForgotPasswordResponse with _$ForgotPasswordResponse {
  const factory ForgotPasswordResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") required Data data,
  }) = _ForgotPasswordResponse;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "emailSent") required bool emailSent,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
