import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/database/auth_methods.dart';
import 'package:inventory_app/screens/addProductScreen/add_product_screen.dart';
import 'package:inventory_app/screens/searchScreen/search_screen.dart';
import 'package:inventory_app/utils/show_loading.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController username;
  final TextEditingController password;
  final GlobalKey<FormState> globalKey;
  const LoginButton({
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
          final User _user = await AuthMethods().loginWithEmailAndPassword(
            username.text,
            password.text,
          );
          Navigator.of(context).pop();
          if (_user != null) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              SearchProductScreen.routeName,
              (route) => false,
            );
          }
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
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
