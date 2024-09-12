import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _preferences;
  static const _keyModelSelected = 'model_selected';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static String? getModelSelected() =>
      _preferences!.getString(_keyModelSelected);
}
