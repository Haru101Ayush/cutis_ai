import 'package:flutter/material.dart';
import 'Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CUTIS-AI',
      theme: ThemeData(colorScheme: ThemeData.light(useMaterial3:true).colorScheme.copyWith(
              primary: const Color.fromARGB(255, 255, 255, 255),
              onPrimary: const Color.fromARGB(255, 15, 15, 15),
              secondary: const Color.fromARGB(255, 0, 141, 105),
              onSecondary: const Color.fromARGB(255, 3, 100, 76)
      )),
      home: Splash_screen(),
    );
  }
}
