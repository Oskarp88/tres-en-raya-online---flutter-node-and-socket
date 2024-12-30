

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resources/game_methods.dart';
import 'package:tictactoe/resources/socket_client.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/utils/utils.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket;

  Socket? get socketClient => _socketClient;

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

  void tapGrid(int index, String roomId, List<String> displayElements){
    if(displayElements[index] == ''){
      _socketClient!.emit('tap',{
        'index': index,
        'roomId': roomId
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

  void updatePlayersStateListener(BuildContext context) {
    _socketClient!.on('updatePlayers', (playerData) {
       Provider.of<RoomDataProvider>(
        context, listen: false
       ).updatePlayer1(
          playerData[0]
        );
       Provider.of<RoomDataProvider>(
        context, listen: false
       ).updatePlayer2(
          playerData[1]
        );
    });
  }

   void updateRoomListener(BuildContext context){
    _socketClient!.on('updateRoom', (room) => {
      Provider.of<RoomDataProvider>(context, listen: false).updateRoomData(room),
    });
  }

  void tappedListener(BuildContext context){
    _socketClient!.on('tapped', (data)=>{
      Provider.of<RoomDataProvider>(context, listen: false).updateDisplayElements(data['index'], data['choice']),
      Provider.of<RoomDataProvider>(context, listen: false).updateRoomData(data['room']),
      GameMethods().checkWinner(context, _socketClient)
    });
  }
}