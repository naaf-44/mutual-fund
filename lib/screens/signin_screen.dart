import 'package:flutter/material.dart';
import 'package:mutual_fund/auth_service/auth_service.dart';
import 'package:mutual_fund/screens/mutual_fund_list_screen.dart';
import 'package:mutual_fund/screens/signup_screen.dart';
import 'package:mutual_fund/utils/form_utils.dart';
import 'package:mutual_fund/utils/validator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        await AuthService.signIn(emailController.text, passwordController.text);
        await AuthService.saveUser();
        if(mounted) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MutualFundListScreen()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormUtils.appBar("SignIn"),
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
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      "If you do not have an account click here to sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: signIn,
                  child: Text('SignIn', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
