import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_mvvm/presentation/manager/language_manager.dart';

const String prefsKeyLang = 'PREFS_KEY_LANG';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  String get language =>
      _sharedPreferences.getString(prefsKeyLang) ??
      Languages.ENGLISH.getValue();
}
