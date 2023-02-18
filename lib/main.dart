import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopp_app/app/pages/home_page/home_page.dart';

import 'app/pages/customers/auth/sign_up/customer_sign_up_page.dart';
import 'app/pages/welcome_page/welcome_to_ui.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomePage(),
      // home: SignUp(),
      initialRoute: '/',
      routes: {
        '/':(context) => WelcomePage(),
        '/signup_page':(context) => SignUp(),
        '/home_page':(context) => Home_page(),
      },
    );
  }
}
