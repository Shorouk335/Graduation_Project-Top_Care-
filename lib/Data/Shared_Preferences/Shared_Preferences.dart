import 'package:shared_preferences/shared_preferences.dart';

class DataCashHelper {
  static SharedPreferences? sp;

  static init() async {
    sp = await SharedPreferences.getInstance();
  }

  static Future<bool> PutData({required String key, required String value}) {
    print("set $value");
    return sp!.setString(key, value);
  }

  static String? GetData({required String key}) {
    return sp!.getString(key);
  }

  static Future<bool> DeleteData({required String key}) {
    print("removeeeeeeeeeeeeeeee");
    return sp!.remove(key);
  }


}
