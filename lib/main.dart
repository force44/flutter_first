import 'package:flutter/material.dart';
import 'screen_index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto',
      routes: {
        '/index': (context) => const IndexScreen(),
      },
      initialRoute: '/index',
    );
  }
}