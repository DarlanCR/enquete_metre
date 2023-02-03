import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  late SharedPreferences preferences;

  SharedPreferencesHelper() {
    initSharedPreference();
  }

  Future initSharedPreference() async {
    preferences = await SharedPreferences.getInstance();
  }} 