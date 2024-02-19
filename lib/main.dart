import 'package:flutter/material.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';
import 'package:store_app/screens/welcome_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        UpdateProductScreen.id: (context) => UpdateProductScreen(),
      },
      initialRoute: WelcomeScreen.id,
    );
  }
}
