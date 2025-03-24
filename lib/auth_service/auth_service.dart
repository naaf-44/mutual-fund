import 'package:flutter/cupertino.dart';
import 'package:mutual_fund/utils/inject.dart';
import 'package:mutual_fund/utils/preference_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static final SupabaseClient client = Supabase.instance.client;

  static Future<AuthResponse> signUp(String email, String password) async {
    return await client.auth.signUp(email: email, password: password);
  }

  static Future<AuthResponse> signIn(String email, String password) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  static Future<void> saveUser() async {
    final session = client.auth.currentSession;
    final preference = getIt<PreferenceHandler>();
    await preference.setEmail(session!.user.email!);
  }
}
