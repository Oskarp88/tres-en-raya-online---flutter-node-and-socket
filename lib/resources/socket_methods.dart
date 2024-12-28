import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resources/socket_client.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/utils/utils.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket;

  void createRoom(String nickname) {
    if(nickname.isNotEmpty){
      _socketClient!.emit('createRoom', {
        'nickname' : nickname,
      });
    }
  }

  void joinRoom(String nickname, String roomId){
    if(nickname.isNotEmpty && roomId.isNotEmpty){
      _socketClient!.emit('joinRoom', {
        'nickname' : nickname,
        'roomId' : roomId
      });
    }
  }

   void createRoomSuccesListener(BuildContext context){
    _socketClient!.on('createRoomSuccess', (room) => {
      Provider.of<RoomDataProvider>(context, listen: false).updateRoomData(room),
      Navigator.pushNamed(context, GameScreen.routeName)
    });
  }

   void joinRoomSuccesListener(BuildContext context){
    _socketClient!.on('joinRoomSuccess', (room) => {
      Provider.of<RoomDataProvider>(context, listen: false).updateRoomData(room),
      Navigator.pushNamed(context, GameScreen.routeName)
    });
  }

   void errorOccuredListener(BuildContext context){
    _socketClient!.on('errorOccurred', (data) => {
       showSnackBar(context, data)
    });
  }
}