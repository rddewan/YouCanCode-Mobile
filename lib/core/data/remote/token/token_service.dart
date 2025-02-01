import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/common/dtos/refresh_token_response.dart';
import 'package:youcancode/common/http_status/status_code.dart';
import 'package:youcancode/core/data/local/secure_storage/isecure_storage.dart';
import 'package:youcancode/core/data/local/secure_storage/secure_storage.dart';
import 'package:youcancode/core/data/local/secure_storage/secure_storage_const.dart';
import 'package:youcancode/core/data/remote/token/itoken_service.dart';

final tokenServiceProvider = Provider.family<ITokenService, Dio>((ref, dio) {
  final secureStorage = ref.watch(secureStorageProvider);

  return TokenService(dio, secureStorage);
});

class TokenService implements ITokenService {
  final Dio _dio;
  final ISecureStorage _secureStorage;

  TokenService(this._dio, this._secureStorage);

  @override
  Future<void> clearToken() {
    return Future.wait([
      _secureStorage.delete(accessTokenKey),
      _secureStorage.delete(refreshTokenKey),
    ]);
  }

  @override
  Future<String?> getAccessToken() => _secureStorage.read(accessTokenKey);

  @override
  Future<String?> getRefreshToken() => _secureStorage.read(refreshTokenKey);

  @override
  Future<RefreshTokenResponse> refreshToken(String? refreshToken) async {
    final response = await _dio.post<Map<String, dynamic>>(
        '/api/v1/auth/refresh-token',
        data: {"refreshToken": refreshToken});

    if (response.statusCode == success) {
      return RefreshTokenResponse.fromJson(response.data ?? {});
    } else {
      throw DioException(
          requestOptions: response.requestOptions, response: response);
    }
  }

  @override
  Future<void> saveToken(String accessToken, String refreshToken) {
    return Future.wait([
      _secureStorage.write(accessTokenKey, accessToken),
      _secureStorage.write(refreshTokenKey, refreshToken)
    ]);
  }
}
