import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<String> {
  static const String _languageKey = 'selected_language';

  LanguageCubit() : super('ru') {
    _loadSelectedLanguage();
  }

  /// Save the selected language to SharedPreferences
  Future<void> selectLanguage(String languageCode) async {
    emit(languageCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  /// Load the selected language from SharedPreferences
  Future<void> _loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? 'ru';
    emit(languageCode);
  }
}
