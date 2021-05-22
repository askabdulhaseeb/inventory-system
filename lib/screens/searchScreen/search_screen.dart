import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                Expanded(
                  child: TextFormField(
                    controller: _barcode,
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
                ),
                const SizedBox(width: 10),
                Container(
                  height: 46,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    // color: Colors.yellow,
                  ),
                  child: const Icon(FontAwesomeIcons.barcode, size: 46),
                ),
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
