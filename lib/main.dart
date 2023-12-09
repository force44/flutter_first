import 'package:flutter/material.dart';
import 'package:lotto/page/login/login_page.dart';
import 'package:lotto/provider/LoginProvider.dart';
import 'package:lotto/provider/LottoStatProvider.dart';
import 'package:lotto/provider/SuggestionLottoProvider.dart';
import 'package:lotto/provider/WinLottoProvider.dart';
import 'screen_index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LottoStatProvider()),
        ChangeNotifierProvider(create: (_) => SuggestionLottoProvider()),
        ChangeNotifierProvider(create: (_) => WinLottoProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto',
      routes: {
        '/index': (context) => IndexScreen(),
        '/login': (context) => LoginPage(),
      },
      initialRoute: '/login'
    );
  }
}