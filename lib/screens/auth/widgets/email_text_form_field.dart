import 'package:flutter/material.dart';

class UsernameTextFormField extends StatefulWidget {
  const UsernameTextFormField({
    Key key,
    @required TextEditingController username,
  })  : _username = username,
        super(key: key);
  final TextEditingController _username;
  @override
  _UsernameTextFormFieldState createState() => _UsernameTextFormFieldState();
}

class _UsernameTextFormFieldState extends State<UsernameTextFormField> {
  void _onListener() => setState(() {});
  @override
  void initState() {
    widget._username.addListener(_onListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._username,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Email is Invalide';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(4),
        fillColor: Colors.white,
        prefix: const SizedBox(width: 14),
        hintText: 'Username',
        suffixIcon: (widget._username.text.isEmpty)
            ? const SizedBox()
            : IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => widget._username.clear(),
              ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
