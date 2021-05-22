import 'package:flutter/material.dart';
import '../widgets/barcode_icon_button.dart';
import '../widgets/search_text_form_field.dart';

class SearchProductScreen extends StatelessWidget {
  static const routeName = '/SearchProductScreen';
  final TextEditingController _barcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SearchTextFormField(barcode: _barcode),
                const SizedBox(width: 10),
                BarcodeIconButton(),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width / 2,
              height: 40,
              alignment: Alignment.center,
              color: Colors.black,
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: size.width / 10 + 2,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: size.width / 10,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Icon(Icons.add,
                      size: size.width / 5, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
