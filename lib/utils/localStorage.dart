// 导入依赖
import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储工具类
class LocalStorage {
  /// 设置布尔的值
  static setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  /// 设置double的值
  static setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  /// 设置int的值
  static setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  /// 设置Sting的值
  static setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  /// 设置StringList
  static setStringList(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  static Future<bool> containsKey(String key) async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.containsKey(key);
  }

  /// 获取返回为bool的内容
  static Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(key);
    if(value!=null) return value;
    return false;    
  }

  /// 获取返回为double的内容
  static Future<double> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    double? value = prefs.getDouble(key);
    if (value == null) return -1;
    return value;
  }

  /// 获取返回为int的内容
  static Future<int> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    int? value = prefs.getInt(key);
    if (value == null) return -1;
    return value;
  }

  /// 获取返回为String的内容
  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    if (value == null) return "nil";
    return value;
  }

  /// 获取返回为StringList的内容
  static Future<List<String>> getStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? value = prefs.getStringList(key);
    if (value == null) return ["nil"];
    return value;
  }

  /// 移除单个
  static remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  /// 清空所有
  static clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
