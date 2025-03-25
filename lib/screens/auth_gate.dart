import 'package:flutter/material.dart';
import 'package:mutual_fund/screens/mutual_fund_list_screen.dart';
import 'package:mutual_fund/screens/signin_screen.dart';
import 'package:mutual_fund/utils/inject.dart';
import 'package:mutual_fund/utils/preference_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// this screen handles different connection state.
/// uses StreamBuilder to listen to the state.
/// if data present in the local navigates to mutual fund list.
/// else goes to login page.

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final preference = getIt<PreferenceHandler>();

        if(preference.getEmail() == null || preference.getEmail()!.isEmpty) {
          return SignInScreen();
        } else {
          return MutualFundListScreen();
        }
      },
    );
  }
}
