// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesManager {
//   static const _tokenKey = 'access_token';

//   // Tokenni saqlash
//   Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenKey, token);
//   }

//   // Tokenni olish
//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_tokenKey);
//   }

//   // Tokenni o'chirish (logout yoki muddati o'tgan bo'lsa)
//   Future<void> clearToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_tokenKey);
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const _tokenKey = 'access_token';

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
}
