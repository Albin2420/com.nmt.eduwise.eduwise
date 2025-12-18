import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final _storage = FlutterSecureStorage();

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  static Future<void> saveTokens({
    String? accessToken,
    String? refreshToken,
  }) async {
    try {
      await _storage.write(key: _accessTokenKey, value: accessToken);
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
    } catch (e) {
      log("⚠️ error in saveTokens():$e");
    }
  }

  static Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: _accessTokenKey);
    } catch (e) {
      log("⚠️ error in getAccessToken():$e");
      return null;
    }
  }

  static Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshTokenKey);
    } catch (e) {
      log("⚠️ error in getRefreshToken():$e");
      return null;
    }
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
