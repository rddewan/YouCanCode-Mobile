

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:youcancode/core/data/local/secure_storage/flutter_secure_storage_provider.dart';
import 'package:youcancode/core/data/local/secure_storage/isecure_storage.dart';


final secureStorageProvider = Provider<ISecureStorage>((ref) {
  final secureStorage = ref.watch(flutterSecureStorageProvider);

  return SecureStorage(secureStorage);

});

final class  SecureStorage implements ISecureStorage {
  final FlutterSecureStorage _secureStorage;

  SecureStorage(this._secureStorage);

  @override
  Future<void> delete(String key) async {
    try {
      await _secureStorage.delete(key: key);
      
    } catch (e) {
      rethrow;
    }
    
  }

  @override
  Future<String?> read(String key) async {

    try {
      return await  _secureStorage.read(key: key);
      
    } catch (e) {
      rethrow;
    }
    
  }

  @override
  Future<void> write(String key, String value) async {

    try {
       await _secureStorage.write(key: key, value: value);
      
    } catch (e) {
      rethrow;
    }
    
  }

}