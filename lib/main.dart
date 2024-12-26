import 'package:flutter/material.dart';
import 'package:tictactoe/screens/menu_main_screen.dart';
import 'package:tictactoe/utils/constants/colors.dart';
import 'package:tictactoe/widgets/room/create_room_screen.dart';
import 'package:tictactoe/widgets/room/join_room_screen.dart';

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
        CreateRoomScreen.routeName : (context) => const CreateRoomScreen(),
        JoinRoomScreen.routeName : (contetx) => const JoinRoomScreen(),
      },
      initialRoute: MenuMainScreen.routeName,
    );
  }
}

