import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  late SharedPreferences _preferences;

  SharedPreferencesHelper() {
    initSharedPreference();
  }

  Future initSharedPreference() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String? getUrlAPI(String key) {
    return _preferences.getString(key);
  }

  Future<bool?> setUrlAPI(String key, String value) async {
    return _preferences.setString(key, value);
  }
}
