import 'package:flutter/material.dart';

class NameTextFormField extends StatefulWidget {
  const NameTextFormField({
    Key key,
    @required TextEditingController name,
  })  : _name = name,
        super(key: key);
  final TextEditingController _name;
  @override
  NameeTextFormFieldState createState() => NameeTextFormFieldState();
}

class NameeTextFormFieldState extends State<NameTextFormField> {
  void _onListener() => setState(() {});
  @override
  void initState() {
    widget._name.addListener(_onListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._name,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.length < 4) {
          return 'Name is Invalide';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(4),
        fillColor: Colors.white,
        prefix: const SizedBox(width: 14),
        hintText: 'Name',
        suffixIcon: (widget._name.text.isEmpty)
            ? const SizedBox()
            : IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => widget._name.clear(),
              ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
