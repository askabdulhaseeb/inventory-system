import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BarcodeIconButton extends StatelessWidget {
  final Function onScan;
  const BarcodeIconButton({
    @required this.onScan,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 46,
        width: 60,
        padding: const EdgeInsets.only(bottom: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5),
        ),
        child: const Icon(FontAwesomeIcons.barcode, size: 44),
      ),
    );
  }
}
