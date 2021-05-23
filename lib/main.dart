import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'database/user_local_data.dart';
import 'screens/addProductScreen/add_product_screen.dart';
import 'screens/auth/loginScreen/login_screen.dart';
import 'screens/auth/signupScreen/signup_screen.dart';
import 'screens/searchScreen/search_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserLocalData.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory System',
      theme: ThemeData(
        primaryColor: const Color(0xFF697189),
        scaffoldBackgroundColor: const Color(0xFFEFF1F8),
      ),
      home: (UserLocalData?.getUID() != null && UserLocalData?.getUID() != '')
          ? SearchProductScreen()
          : LoginScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        SearchProductScreen.routeName: (ctx) => SearchProductScreen(),
        AddProductScreen.routeName: (ctx) => AddProductScreen(),
      },
    );
  }
}

//  Certificate fingerprints:
//    SHA1: F6:3C:6E:07:37:98:D1:37:8D:8D:AD:2B:80:BE:5E:2C:50:EF:71:F9
//    SHA256: B8:1F:B2:FF:CB:2E:A2:45:12:1B:22:43:35:C5:B6:CC:A5:3B:CE:D4:6B:97:93:EF:76:D9:81:0F:F9:16:4C:6E
