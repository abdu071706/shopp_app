import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:shopp_app/app/pages/customers/auth/cutomer_login_page.dart';
import 'package:shopp_app/app/pages/customers/auth/sign_up/customer_sign_up_page.dart';
import 'package:shopp_app/app/pages/customers/auth/sign_up/widgets/sign_upText_widget.dart';
import 'package:shopp_app/app/pages/customers/main_pages/customer/customer_page.dart';
import 'package:shopp_app/app/pages/home_page/home_page.dart';
import 'package:shopp_app/app/pages/suppliers/category_page.dart';
import 'package:shopp_app/app/pages/welcome_page/welcome_to_ui.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: CategoryPage(),

      initialRoute: '/welcome_page',
      routes: {
        '/welcome_page': (context) => WelcomePage(),
        '/home_page': (context) => Home_page(),
        '/cutomer_login_page': (context) => CustomerLogInPage(),
        '/customer_sign_up_page': (context) => SignUp(),
        '/customer_page': (context) => CustomerPage(),
        // '/customer_login_page': (context) => CustomerLogInPage(),
      },
    );
  }
}
