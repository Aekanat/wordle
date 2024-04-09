import 'package:flutter/material.dart';
import 'package:wordle/pages/_introPage.dart';

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
       fontFamily: 'Read',
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 170, 41, 37)),
        useMaterial3: true,
      ),
      home: const intro()
    );
  }
}