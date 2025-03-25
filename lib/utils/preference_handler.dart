import 'package:shared_preferences/shared_preferences.dart';

/// preference handler used to store the data locally
class PreferenceHandler {
  late SharedPreferences preferences;

  /// initialization
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  /// save email
  Future<void> setEmail(String email) async {
    await preferences.setString("email", email);
  }

  /// get email
  String? getEmail() {
    return preferences.getString("email");
  }
}