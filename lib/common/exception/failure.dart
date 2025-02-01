import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure implements Exception {
  const factory Failure({
    required String message,
    int? statusCode,
    Exception? exception,
    @Default(StackTrace.empty) StackTrace stackTrace,
  }) = _Failure;
}
