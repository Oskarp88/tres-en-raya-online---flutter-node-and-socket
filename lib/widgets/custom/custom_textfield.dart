import 'package:flutter/material.dart';
import 'package:tictactoe/utils/constants/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key, 
    required this.controller, 
    required this.hintText,
    this.isReadOnly = false,
  });
  final bool isReadOnly;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent,
            blurRadius: 5,
            spreadRadius: 2
          )
        ]
      ),
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          fillColor: BgColor,
          filled: true,
          hintText: hintText
        ),
      ),
    );
  }
}