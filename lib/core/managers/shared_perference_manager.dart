import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception("SharedPreferences not initialized");
    }
    return _preferences!;
  }

  static Future<void> setEmail(String email) async {
    await preferences.setString('email', email);
  }

  static String? getEmail() {
    return preferences.getString('email');
  }

  static Future<void> setName(String name) async {
    await preferences.setString('name', name);
  }

  static String? getName() {
    return preferences.getString('name');
  }
}
