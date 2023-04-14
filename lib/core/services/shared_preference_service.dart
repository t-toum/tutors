import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutors/core/error/exceptions.dart';

abstract class SharedPreferenceService {
  Future<bool> setData<T>({required String key, required T data});
  T? getData<T>({required String key});
}

@LazySingleton(as: SharedPreferenceService)
class SharedPreferenceServiceImpl implements SharedPreferenceService {
  final SharedPreferences _preferences;
  SharedPreferenceServiceImpl(this._preferences);

  @override
  Future<bool> setData<T>({required String key, required T data}) async {
    try {
      if (T == String) {
        return await _preferences.setString(key, data as String);
      } else if (T == bool) {
        return await _preferences.setBool(key, data as bool);
      } else if (T == int) {
        return await _preferences.setInt(key, data as int);
      } else {
        return await _preferences.setStringList(key, data as List<String>);
      }
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  T? getData<T>({required String key}) {
    try {
      if (T == String) {
        return _preferences.getString(key) as T;
      } else if (T == bool) {
        return _preferences.getBool(key) as T;
      } else if (T == int) {
        return _preferences.getInt(key) as T;
      } else {
        return _preferences.getStringList(key) as T;
      }
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
