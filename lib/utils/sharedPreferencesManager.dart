import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const _tokenKey = 'access_token';
  static const _phoneNumber = 'phone';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<void> savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_phoneNumber, phone);
  }

  Future<String?> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_phoneNumber);
  }

  Future<void> clearPhone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_phoneNumber);
  }
}
