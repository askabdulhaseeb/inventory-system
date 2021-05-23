import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inventory_app/utils/show_toast.dart';

class BarcodeIconButton extends StatefulWidget {
  final Function onScan;
  const BarcodeIconButton({
    @required this.onScan,
    Key key,
  }) : super(key: key);
  @override
  _BarcodeIconButtonState createState() => _BarcodeIconButtonState();
}

class _BarcodeIconButtonState extends State<BarcodeIconButton> {
  @override
  Widget build(BuildContext context) {
    String barcode;
    //scan barcode asynchronously
    Future barcodeScanning() async {
      try {
        final ScanResult scaned = await BarcodeScanner.scan();
        final String scanResult = scaned.rawContent;
        // final doc = await DatabaseMethods().fetchProductInfo(barcode: scanResult);
        // Product product = Product.fromDocument(doc);
        // Provider.of<ProductProvider>(context, listen: false)
        //     .addNewProduct(product: product);
        // print('Stored in Product Provider');
        // Provider.of<CartProvider>(context, listen: false).addItemInCart(
        //   barcode: product.barcode,
        //   quantity: 1,
        //   price: product.price,
        // );
        // print('Stored in Cart');

        setState(() => barcode = scanResult);
      } on PlatformException catch (e) {
        showErrorToast('Product Not Found');
      }
    }

    return GestureDetector(
      onTap: () {
        barcodeScanning();
        widget.onScan(barcode);
      },
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
