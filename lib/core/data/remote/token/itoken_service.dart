import 'package:youcancode/common/dtos/refresh_token_response.dart';

abstract interface class ITokenService {
  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> saveToken(String accessToken, String refreshToken);

  Future<void> clearToken();

  Future<RefreshTokenResponse> refreshToken(String? refreshToken);
}
