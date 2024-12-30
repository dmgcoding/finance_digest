import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  const LocalStorageService({required this.prefs});
  final SharedPreferences prefs;

  static const firstNameKey = 'firstNameKey';
  static const lastNameKey = 'lastNameKey';

  Future<bool> saveStrValue(String key, String value) async {
    try {
      return await prefs.setString(key, value);
    } catch (e) {
      rethrow;
    }
  }

  String? getStrValue(String key) {
    return prefs.getString(key);
  }
}
