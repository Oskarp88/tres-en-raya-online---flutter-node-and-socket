import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/widgets/custom/custom_button.dart';
import 'package:tictactoe/widgets/room/create_room_screen.dart';
import 'package:tictactoe/widgets/room/join_room_screen.dart';

class MenuMainScreen extends StatelessWidget {
  const MenuMainScreen({super.key});
  static String routeName = '/main-menu'; 

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () => createRoom(context), 
                text: 'Create Room'
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () => joinRoom(context), 
                text: 'Join Room'
              ),
            ],
          ),
        ),
      )
    );
  }
}