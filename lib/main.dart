import 'package:flutter/material.dart';
import 'package:mutual_fund/screens/auth_gate.dart';
import 'package:mutual_fund/utils/app_strings.dart';
import 'package:mutual_fund/utils/inject.dart';
import 'package:mutual_fund/utils/preference_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  inject();
  await getIt<PreferenceHandler>().init();

  await Supabase.initialize(
    url: AppString.apiUrl,
    anonKey: AppString.apiKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}