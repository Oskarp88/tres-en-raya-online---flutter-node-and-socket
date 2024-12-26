import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/widgets/custom/custom_button.dart';

class MenuMainScreen extends StatelessWidget {
  const MenuMainScreen({super.key});
  static String routeName = '/main-menu'; 
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
                onTap: () {}, 
                text: 'Create Room'
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {}, 
                text: 'Join Room'
              ),
            ],
          ),
        ),
      )
    );
  }
}