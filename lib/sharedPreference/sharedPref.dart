import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static late SharedPreferences pref;
  static bool isInitialized = false;

  // sharedpreference のインスタンスの作成
  static Future<void> init() async{
    pref = await SharedPreferences.getInstance();
    isInitialized = true;
  }

  static void saveStringData(Keys key, String value) async{
    if(!isInitialized) await init();
    await pref.setString(key.name, value);
  }

  static Future<String> getStringData(Keys key) async{
    if(!isInitialized) await init();
    return pref.getString(key.name)!;
  }
}

enum Keys {
  userId,
  userName,
  email,
}