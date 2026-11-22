import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences?> sharedPreferencesOrNull() async {
  try {
    return await SharedPreferences.getInstance();
  } on Object {
    return null;
  }
}
