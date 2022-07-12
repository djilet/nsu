import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISecureStorage {
  Future<void> write<T extends Object>({required String key, required T value});
  Future<void> delete({required String key});
  Future<void> deleteAll();
  Future<T?> read<T extends Object>({required String key});
  Future<Map<String, dynamic>> readAll();
}

class SecureStorage implements ISecureStorage {
  @override
  Future<void> delete({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Future<T?> read<T extends Object>({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (T == int) {
      return prefs.getInt(key) as T?;
    }

    if (T == double) {
      return prefs.getDouble(key) as T?;
    }

    if (T == bool) {
      return prefs.getBool(key) as T?;
    }

    if (T == String) {
      return prefs.getString(key) as T?;
    }

    if (<String>[] is T) {
      prefs.getStringList(key) as T?;
    }

    throw ArgumentError('Type $T not allowed', 'value');
  }

  @override
  Future<Map<String, dynamic>> readAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();

    Map<String, dynamic> prefsMap = new Map<String, dynamic>();
    keys.forEach((key) {
      prefsMap[key] = prefs.get(key);
    });

    return prefsMap;
  }

  @override
  Future<void> write<T extends Object>({
    required String key,
    required T value,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (T == int) {
      prefs.setInt(key, value as int);
    } else if (T == double) {
      prefs.setDouble(key, value as double);
    } else if (T == bool) {
      prefs.setBool(key, value as bool);
    } else if (T == String) {
      prefs.setString(key, value as String);
    } else if (<String>[] is T) {
      prefs.setStringList(key, value as List<String>);
    } else {
      throw ArgumentError('Type $T not allowed', 'value');
    }
  }
}