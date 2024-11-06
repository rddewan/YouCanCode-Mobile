// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordResponseImpl _$$ForgotPasswordResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPasswordResponseImpl(
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ForgotPasswordResponseImplToJson(
        _$ForgotPasswordResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      emailSent: json['emailSent'] as bool,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'emailSent': instance.emailSent,
    };
