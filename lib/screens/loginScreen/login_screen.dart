import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}

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
      onTap: () {
        if (globalKey.currentState.validate()) {
          // Login
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
