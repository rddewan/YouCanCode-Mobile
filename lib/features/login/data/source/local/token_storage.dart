
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/core/data/local/secure_storage/isecure_storage.dart';
import 'package:youcancode/core/data/local/secure_storage/secure_storage.dart';
import 'package:youcancode/core/data/local/secure_storage/secure_storage_const.dart';
import 'package:youcancode/features/login/data/source/local/itoken_storage.dart';

final tokenStorageProvider = Provider<ITokenStorage>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);

  return TokenStorage(secureStorage);

});

final class TokenStorage implements ITokenStorage {
  final ISecureStorage _secureStorage;

  TokenStorage(this._secureStorage);

  @override
  Future<void> storeToken(String accessToken, String refreshToken) async {
    await _secureStorage.write(accessTokenKey, accessToken);
    await _secureStorage.write(refreshTokenKey, refreshToken);    
  }

}