import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_challenge/features/data/cache/cache_storage.dart';

class CacheAdapter extends CacheStorage {
  final SharedPreferences sharedPreferences;

  CacheAdapter({required this.sharedPreferences});

  @override
  Future<void> delete(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  Future<Object?> fetch(String key) async {
    final result = await sharedPreferences.get(key);
    return result;
  }

  @override
  Future<void> save({required String key, required value}) async {
    await sharedPreferences.setString(key, value);
  }
}
