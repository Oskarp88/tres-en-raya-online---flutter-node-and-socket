import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<RoomDataProvider>(context).roomData;
    return Scaffold(
      body: Center(
        child: Text(Provider.of<RoomDataProvider>(context).roomData.toString()),
      ),
    );
  }
}