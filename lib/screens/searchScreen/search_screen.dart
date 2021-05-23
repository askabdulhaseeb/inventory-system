import 'package:flutter/material.dart';
import 'package:inventory_app/screens/addProductScreen/add_product_screen.dart';
import 'package:inventory_app/utils/copyrights.dart';
import '../widgets/barcode_icon_button.dart';
import '../widgets/search_text_form_field.dart';

class SearchProductScreen extends StatefulWidget {
  static const routeName = '/SearchProductScreen';
  @override
  _SearchProductScreenState createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  final TextEditingController _barcode = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String scanedBarcode;
  @override
  void initState() {
    super.initState();
    scanedBarcode = '';
  }

  @override
  Widget build(BuildContext context) {
    void _onScan(String result) {
      scanedBarcode = result;
      setState(() {});
    }

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SearchTextFormField(barcode: _barcode),
                  const SizedBox(width: 10),
                  BarcodeIconButton(onScan: _onScan),
                ],
              ),
              const SizedBox(height: 20),
              if (scanedBarcode != '')
                Text(
                  'Scaned Barcode: $scanedBarcode',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              if (scanedBarcode != '') const SizedBox(height: 20),
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
                onTap: () {
                  Navigator.of(context).pushNamed(AddProductScreen.routeName);
                },
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
              ),
              const SizedBox(height: 30),
              Copyrights(),
            ],
          ),
        ),
      ),
    );
  }
}
