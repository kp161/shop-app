import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async' show Future;

Future<Box> get _instance async => _box ??= await _openBox();
Box? _box;
Box? _boxInstance;
bool _initCalled = false;

Future<Box?> initHive() async {
  _initCalled = true;
  _boxInstance = await _instance;
  return _boxInstance;
}

Future<Box> _openBox() async {
  await Hive.initFlutter();
  return await Hive.openBox('prefs');
}

void dispose() async {
  _box = null;
  _boxInstance = null;
  await Hive.close();
}

void isPreferenceReady() {
  assert(
    _initCalled,
    "Prefs.init() must be called first in an initState() preferably!",
  );
  assert(_boxInstance != null, "Hive box not ready yet!");
}

///get(Read method)
Set<String> getKeys() {
  isPreferenceReady();
  return _boxInstance?.keys.cast<String>().toSet() ?? <String>{};
}

Future<Set<String>> getKeysF() async {
  Set<String> value;
  if (_boxInstance == null) {
    Box box = await _instance;
    value = box.keys.cast<String>().toSet();
  } else {
    value = getKeys();
  }
  return value;
}

dynamic getDynamic(String key) {
  isPreferenceReady();
  return _boxInstance?.get(key);
}

Future<dynamic> getDynamicF(String key) async {
  dynamic value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key);
  } else {
    value = getDynamic(key);
  }
  return value;
}

bool getBool(String key, [bool? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as bool? ?? defValue ?? false;
}

Future<bool> getBoolF(String key, [bool? defValue]) async {
  bool value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as bool? ?? defValue ?? false;
  } else {
    value = getBool(key);
  }
  return value;
}

int getInt(String key, [int? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as int? ?? defValue ?? 0;
}

Future<int> getIntF(String key, [int? defValue]) async {
  int value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as int? ?? defValue ?? 0;
  } else {
    return getInt(key);
  }
  return value;
}

double getDouble(String key, [double? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as double? ?? defValue ?? 0.0;
}

Future<double> getDoubleF(String key, [double? defValue]) async {
  double value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as double? ?? defValue ?? 0.0;
  } else {
    value = getDouble(key);
  }
  return value;
}

String getString(String key, [String? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as String? ?? defValue ?? "";
}

Future<String> getStringF(String key, [String? defValue]) async {
  String value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as String? ?? defValue ?? "";
  } else {
    value = getString(key);
  }
  return value;
}

List<String> getStringList(String key, [List<String>? defValue]) {
  isPreferenceReady();
  return _boxInstance?.get(key) as List<String>? ?? defValue ?? [];
}

Future<List<String>> getStringListF(
  String key, [
  List<String>? defValue,
]) async {
  List<String> value;
  if (_boxInstance == null) {
    var box = await _instance;
    value = box.get(key) as List<String>? ?? defValue ?? [];
  } else {
    value = getStringList(key);
  }
  return value;
}

///set (write method)
Future<bool> setBool(String key, bool value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

Future<bool> setInt(String key, int value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

Future<bool> setDouble(String key, double value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

Future<bool> setString(String key, String value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

Future<bool> setStringList(String key, List<String> value) async {
  var box = await _instance;
  await box.put(key, value);
  return true;
}

Future<bool> remove(String key) async {
  var box = await _instance;
  await box.delete(key);
  return true;
}

Future<bool> clear() async {
  var box = await _instance;
  await box.clear();
  return true;
}

ValueListenable<Box> listenable([List<String>? keys]) {
  isPreferenceReady();
  return _boxInstance!.listenable(keys: keys);
}
