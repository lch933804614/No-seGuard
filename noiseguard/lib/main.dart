import 'package:flutter/material.dart';
import 'package:noiseguard/one_touch_notify/notify_page.dart';

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
      theme: ThemeData.dark(),
      home: const NotifyPage(),
    );
  }
}

