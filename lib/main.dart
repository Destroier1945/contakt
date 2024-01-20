import 'package:contakt/pages/splashscreen.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplasshScreen(),
    );
  }
}
