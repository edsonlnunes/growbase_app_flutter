import 'package:growbase_mobile_flutter/shared/data/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStorage {
  Future<bool> setValue(String key, String value);
  Future<String?> getValue(String key);
  Future<bool> removeValue(String key);
}

class SharedPreferenceStorage implements ILocalStorage {
  late SharedPreferences _sharedPreferences;

  @override
  Future<String?> getValue(String key) async {
    if (key.isEmpty) throw AdapterException('Deve ser informado uma key');
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.getString(key);
  }

  @override
  Future<bool> setValue(String key, String value) async {
    if (key.isEmpty) throw AdapterException('Deve ser informado uma key');
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> removeValue(String key) async {
    if (key.isEmpty) throw AdapterException('Deve ser informado uma key');
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.remove(key);
  }
}
