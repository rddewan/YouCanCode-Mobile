import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youcancode/core/data/local/secure_storage/secure_storage.dart';
import 'package:youcancode/core/data/local/secure_storage/secure_storage_const.dart';
import 'package:youcancode/core/provider/auth_state_provider.dart';

part 'start_up_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> startUp(Ref ref) async {
  final secureStorage = ref.watch(secureStorageProvider);
  final accessToken = await secureStorage.read(accessTokenKey);

  if (accessToken != null) {
    ref.read(authStateProvider.notifier).setAuthState(true);
  }
  
}