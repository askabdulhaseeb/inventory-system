import 'package:flutter/material.dart';
import 'package:inventory_app/screens/auth/loginScreen/signup_line.dart';
import 'package:inventory_app/utils/copyrights.dart';
import '../widgets/email_text_form_field.dart';
import '../widgets/password_text_form_field.dart';
import 'login_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F8),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UsernameTextFormField(username: _username),
              const SizedBox(height: 10),
              PasswordTextFormField(password: _password),
              const SizedBox(height: 20),
              LoginButton(
                globalKey: _globalKey,
                username: _username,
                password: _password,
              ),
              const SizedBox(height: 20),
              SignUpLine(),
              const SizedBox(height: 30),
              Copyrights(),
            ],
          ),
        ),
      ),
    );
  }
}
