import 'package:shared_preferences/shared_preferences.dart';

class _SharedPreferencesKeys {
  static const String rememberMe = 'REMEMBER_ME_CHECK';
  static const String firstTime = 'IS_FIRST_TIME';
}

class SharedPreferencesService {
  Future<bool> get rememberMe async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_SharedPreferencesKeys.rememberMe) ?? false;
  }

  Future<void> setRememberMe(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_SharedPreferencesKeys.rememberMe, value);
  }

  Future<bool> get isFirstTime async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_SharedPreferencesKeys.firstTime) ?? true;
  }

  Future<void> setFirstTime(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_SharedPreferencesKeys.firstTime, value);
  }

  Future<void> writeIfNullString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) {
      await prefs.setString(key, value);
    }
  }

  Future<void> writeIfNullBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) {
      await prefs.setBool(key, value);
    }
  }

  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
