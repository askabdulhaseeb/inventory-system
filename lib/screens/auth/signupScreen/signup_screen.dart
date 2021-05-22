import 'package:flutter/material.dart';
import 'package:inventory_app/screens/auth/signupScreen/login_line.dart';
import '../widgets/email_text_form_field.dart';
import '../widgets/name_text_form_field.dart';
import '../widgets/password_text_form_field.dart';
import 'signup_button.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/SignupScreen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _name = TextEditingController();
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
              NameTextFormField(name: _name),
              const SizedBox(height: 10),
              UsernameTextFormField(username: _username),
              const SizedBox(height: 10),
              PasswordTextFormField(password: _password),
              const SizedBox(height: 20),
              SignupButton(
                globalKey: _globalKey,
                name: _name,
                username: _username,
                password: _password,
              ),
              const SizedBox(height: 20),
              LoginnLine(),
            ],
          ),
        ),
      ),
    );
  }
}
