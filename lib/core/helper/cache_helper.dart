import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
   static late SharedPreferences sharedPreferences ;




  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

   static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

   static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

   static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

   static Future<bool> clear() async {
    return await sharedPreferences.clear();
  }

   static  bool containsKey({
    required String key,
  })  {
    return sharedPreferences.containsKey(key);
  }

   static  List<String> getAllKeys() {
    return sharedPreferences.getKeys().toList();
  }

   static dynamic getAllValues() {
    return sharedPreferences
        .getKeys()
        .map((key) => sharedPreferences.get(key))
        .toList();
  }

   static int getIntData({
    required String key,
  })  {
    return sharedPreferences.getInt(key) ?? 0;
  }
}
