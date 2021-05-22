import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField({
    Key key,
    @required TextEditingController barcode,
  })  : _barcode = barcode,
        super(key: key);
  final TextEditingController _barcode;
  @override
  _SearchTextFormFieldState createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  void _onListener() => setState(() {});
  @override
  void initState() {
    widget._barcode.addListener(_onListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: widget._barcode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: const Icon(Icons.search),
          hintText: 'Scan Barcode or search for product',
          hintStyle: const TextStyle(fontSize: 13),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          suffixIcon: const Icon(
            FontAwesomeIcons.solidTimesCircle,
            size: 14,
          ),
        ),
      ),
    );
  }
}
