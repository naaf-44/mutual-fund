import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  late SharedPreferences preferences;

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> setEmail(String email) async {
    await preferences.setString("email", email);
  }

  String? getEmail() {
    return preferences.getString("email");
  }
}