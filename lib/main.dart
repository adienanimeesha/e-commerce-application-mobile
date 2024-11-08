import 'package:flutter/material.dart';
import 'package:e_commerce_application/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSwatch(
       primarySwatch: Colors.grey,
 ).copyWith
       (secondary: Color.fromARGB(255, 218, 216, 216),
       ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
);
  }
}
  