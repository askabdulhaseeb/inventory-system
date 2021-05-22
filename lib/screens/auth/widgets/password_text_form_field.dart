import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    Key key,
    @required TextEditingController password,
  })  : _password = password,
        super(key: key);
  final TextEditingController _password;
  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  void _onListener() => setState(() {});
  bool _showPassword = true;
  @override
  void initState() {
    widget._password.addListener(_onListener);
    _showPassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._password,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _showPassword,
      validator: (value) {
        if (value.length < 6) return 'Password should be greater then 6 digits';
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(4),
        fillColor: Colors.white,
        prefix: const SizedBox(width: 14),
        hintText: 'Password',
        suffixIcon: (_showPassword == true)
            ? IconButton(
                icon: const Icon(Icons.remove_red_eye_outlined),
                onPressed: () => setState(() {
                  _showPassword = false;
                }),
              )
            : IconButton(
                icon: const Icon(Icons.remove_red_eye),
                onPressed: () => setState(() {
                  _showPassword = true;
                }),
              ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
