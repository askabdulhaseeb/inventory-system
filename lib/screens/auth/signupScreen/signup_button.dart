import 'package:flutter/material.dart';
import 'package:inventory_app/database/auth_methods.dart';
import 'package:inventory_app/utils/show_loading.dart';

class SignupButton extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController username;
  final TextEditingController password;
  final GlobalKey<FormState> globalKey;
  const SignupButton({
    @required this.name,
    @required this.username,
    @required this.password,
    @required this.globalKey,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (globalKey.currentState.validate()) {
          showLoadingDislog(context);
          await AuthMethods().signupWithEmailAndPassword(
            name: name.text,
            email: username.text,
            password: password.text,
          );
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      },
      child: Container(
        width: double.infinity,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
