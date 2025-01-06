import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<void> saveInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  Future<void> saveBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  Future<void> saveList<T>(String key, List<T> list) async {
    final prefs = await _prefs;
    await prefs.setString(key, jsonEncode(list));
  }

  Future<List<String>> getList(String key) async {
    final prefs = await _prefs;
    String? listString = prefs.getString(key);
    if (listString != null) {
      List<dynamic> decodedList = jsonDecode(listString);
      return decodedList.cast<String>();
    }
    return [];
  }
}
