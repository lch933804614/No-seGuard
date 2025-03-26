import 'package:flutter/material.dart';
import 'package:noiseguard/tab_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noise Guard',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'PretendardBold',
      ),
      home: MainScreen(),
    );
  }
}