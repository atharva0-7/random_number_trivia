import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<String> getValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? str = pref.getString('numberValue');
    return str ?? "";
  }

  setValue(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('numberValue', value);
  }
}
