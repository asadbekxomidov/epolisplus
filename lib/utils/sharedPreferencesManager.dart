import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const _tokenKey = 'access_token';
  static const _phoneNumber = 'phone';
  static const _password = 'password';

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

  Future<void> savePassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_password, password);
  }

  Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_password);
  }

  Future<void> clearPassword() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_password);
  }

  Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_password);
    await prefs.remove(_phoneNumber);
    await prefs.remove(_tokenKey);
  }
}

class SelectStorage {
  static const _birthDate = 'birth_date';

  Future<void> saveBirthDate(String birthDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_birthDate, birthDate);
  }

  Future<String?> getBirthDate() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_birthDate);
  }

  Future<void> clearBirthDate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_birthDate);
  }
}
