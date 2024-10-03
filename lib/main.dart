import 'package:flutter/material.dart';
import 'package:shop_app_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1),primary:  const Color.fromRGBO(254, 206, 1, 1)),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black
          )
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          )
        ),
        useMaterial3: true
      ),
      home:  HomePage(),
    );
  }
}
