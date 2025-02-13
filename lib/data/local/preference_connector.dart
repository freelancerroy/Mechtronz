import 'package:shared_preferences/shared_preferences.dart';

class PrefConnector {
  _getSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getString(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    return prefs.getString(key);
  }

  Future<int?> getInt(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    return prefs.getInt(key);
  }

  Future<double?> getDouble(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    return prefs.getDouble(key);
  }

  Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    return prefs.getBool(key);
  }

  Future setString(String key, String value) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.setString(key, value);
  }

  Future setInt(String key, int value) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.setInt(key, value);
  }

  Future setDouble(String key, double value) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.setDouble(key, value);
  }

  Future setBool(String key, bool value) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.setBool(key, value);
  }

  Future removePreference(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.remove(key);
  }

  Future clear() async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.clear();
  }
}
