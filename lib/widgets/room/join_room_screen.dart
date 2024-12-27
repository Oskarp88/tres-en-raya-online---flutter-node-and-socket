import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/widgets/custom/custom_button.dart';
import 'package:tictactoe/widgets/custom/custom_text.dart';
import 'package:tictactoe/widgets/custom/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  static String routeName = 'join-room';

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _gameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadow: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.green
                  )
                ], 
                text: 'Join Room', 
                fontSize: 70
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextfield(
                controller:_nameController,
                hintText: 'Enter your nickname'
              ),
              SizedBox(height: size.height * 0.02),
              CustomTextfield(
                controller:_gameController,
                hintText: 'Enter Game ID'
              ),
              SizedBox(height: size.height * 0.04),
              CustomButton(onTap: (){}, text: 'Join')
            ],
          ),
        ),
      ),
    );
  }
}