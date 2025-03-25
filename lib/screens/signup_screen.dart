import 'package:flutter/material.dart';
import 'package:mutual_fund/auth_service/auth_service.dart';
import 'package:mutual_fund/screens/mutual_fund_list_screen.dart';
import 'package:mutual_fund/screens/signin_screen.dart';
import 'package:mutual_fund/utils/form_utils.dart';
import 'package:mutual_fund/utils/validator.dart';

/// signUp screen used to signup to the application.
/// sign up using email and password.

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void signUp() async {
    if (formKey.currentState!.validate()) {
      if(passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password mismatch"),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        try {
          await AuthService.signUp(emailController.text, passwordController.text);
          await AuthService.saveUser();
          if(mounted) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MutualFundListScreen()));
          }
        } catch (e) {
          if(mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Error: $e"),
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormUtils.appBar("SignUp"),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: FormUtils.inputDecoration(labelText: "Email"),
                  validator: Validator.validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: FormUtils.inputDecoration(labelText: "Password"),
                  validator: Validator.validatePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: FormUtils.inputDecoration(labelText: "Confirm Password"),
                  validator: Validator.validatePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                    },
                    child: Text(
                      "If you already have an account click here to sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: signUp,
                  child: Text('SignUp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
