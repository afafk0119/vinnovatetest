import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const _kuserId = 'userId';

  static const _kThemeData = "themeData";

  static late final SharedPreferences _sharedPrefs;
  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  static Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String get userId => _sharedPrefs.getString(_kuserId) ?? "";

  set userId(String value) {
    _sharedPrefs.setString(_kuserId, value);
  }

  bool get themeData => _sharedPrefs.getBool(_kThemeData) ?? false;

  set themeData(bool value) {
    _sharedPrefs.setBool(_kThemeData, value);
  }

  removeValues() {
    //can use _sharedPrefs.clear(); for clearing shared preferences altogether

    _sharedPrefs.remove(_kuserId);
  }
}
