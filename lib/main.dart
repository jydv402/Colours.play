import 'package:flutter/material.dart';

import 'homepage.dart';

// The main file
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Colours.play',
      home: Homepage(),
    );
  }
}
