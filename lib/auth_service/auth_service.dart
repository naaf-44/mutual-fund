import 'package:mutual_fund/utils/inject.dart';
import 'package:mutual_fund/utils/preference_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// AuthService class to hanle authentication service
/// handles signUp, signIn, signOut and saveUser

class AuthService {
  /// create SupaBase instance
  static final SupabaseClient client = Supabase.instance.client;

  /// signUp
  static Future<AuthResponse> signUp(String email, String password) async {
    return await client.auth.signUp(email: email, password: password);
  }

  /// signIn
  static Future<AuthResponse> signIn(String email, String password) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// signOut
  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  /// saveUser
  static Future<void> saveUser() async {
    final session = client.auth.currentSession;
    final preference = getIt<PreferenceHandler>();
    await preference.setEmail(session!.user.email!);
  }
}
