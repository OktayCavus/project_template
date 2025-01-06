import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

// Uygulama sınıfı

@singleton
class LocalStorage {
  // SharedPreferences örneğine erişim
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<void> saveString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  @override
  Future<int?> getInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  @override
  Future<void> saveList<T>(String key, List<T> list) async {
    final prefs = await _prefs;
    await prefs.setString(key, jsonEncode(list));
  }

  @override
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
