import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityService {
  static const _storage = FlutterSecureStorage();
  static const _mpinKey = 'user_mpin';

  Future<void> saveMPIN(String mpin) async {
    await _storage.write(key: _mpinKey, value: mpin);
  }

  Future<String?> getMPIN() async {
    return await _storage.read(key: _mpinKey);
  }

  Future<void> deleteMPIN() async {
    await _storage.delete(key: _mpinKey);
  }
}
