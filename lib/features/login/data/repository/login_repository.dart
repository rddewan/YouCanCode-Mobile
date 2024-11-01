

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youcancode/features/login/data/dto/request/login_request.dart';
import 'package:youcancode/features/login/data/dto/response/login_response.dart';
import 'package:youcancode/features/login/data/repository/ilogin_repository.dart';
import 'package:youcancode/features/login/data/source/local/itoken_storage.dart';
import 'package:youcancode/features/login/data/source/local/token_storage.dart';
import 'package:youcancode/features/login/data/source/remote/login_api.dart';

final loginRepositoryProvider = Provider<ILoginRepository>((ref) {
  final loginApi = ref.watch(loginApiProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);

  return LoginRepository(loginApi, tokenStorage);  
});

final class LoginRepository implements ILoginRepository {
  final LoginApi _loginApi;
  final ITokenStorage _tokenStorage;

  LoginRepository(this._loginApi, this._tokenStorage);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      // api call
      final response = await _loginApi.login(loginRequest);
      // get access token and refresh token from response
      final accessToken = response.data.accessToken;
      final refreshToken = response.data.refreshToken;
      // store in secure storage
      await _tokenStorage.storeToken(accessToken, refreshToken);

      return response;
      
    } on DioException catch (_) {
      rethrow;
    }
  }
  
}