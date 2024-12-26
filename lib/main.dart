import 'package:flutter/material.dart';
import 'package:tictactoe/screens/menu_main_screen.dart';
import 'package:tictactoe/utils/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: BgColor
      ),
      routes: {
        MenuMainScreen.routeName : (context) => const MenuMainScreen(),
      },
      home: const MenuMainScreen(),
    );
  }
}

