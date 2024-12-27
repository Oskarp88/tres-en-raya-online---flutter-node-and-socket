import 'package:flutter/material.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/widgets/custom/custom_button.dart';
import 'package:tictactoe/widgets/custom/custom_text.dart';
import 'package:tictactoe/widgets/custom/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});
    static String routeName = 'create-room';

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();

}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState(){
    super.initState();
    _socketMethods.createRoomSuccesListener(context);
  }
  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
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
                text: 'Create Room', 
                fontSize: 70
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextfield(
                controller:_nameController,
                hintText: 'Enter your nickname'
              ),
              SizedBox(height: size.height * 0.04),
              CustomButton(
                onTap: ()=> _socketMethods.createRoom(_nameController.text), 
                text: 'Create'
              )
            ],
          ),
        ),
      ),
    );
  }
}