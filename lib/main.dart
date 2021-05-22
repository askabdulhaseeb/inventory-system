import 'package:flutter/material.dart';
import 'package:inventory_app/screens/addProductScreen/add_product_screen.dart';
import 'package:inventory_app/screens/loginScreen/login_screen.dart';
import 'package:inventory_app/screens/searchScreen/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SearchProductScreen.routeName: (ctx) => SearchProductScreen(),
        AddProductScreen.routeName: (ctx) => AddProductScreen(),
      },
    );
  }
}
