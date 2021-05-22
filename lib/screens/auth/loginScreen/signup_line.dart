import 'package:flutter/material.dart';
import '../signupScreen/signup_screen.dart';

class SignUpLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account? ',
          style: TextStyle(
            fontSize: 11,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(SignupScreen.routeName);
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
