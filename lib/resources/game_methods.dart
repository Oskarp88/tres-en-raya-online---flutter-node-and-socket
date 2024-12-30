import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tictactoe/provider/room_data_provider.dart';

class GameMethods {
  void checkWinner(BuildContext context, Socket socketClient) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context, listen: false);

    // Definir combinaciones ganadoras
    List<List<int>> winningCombinations = [
      [0, 1, 2], // filas
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6], // columnas
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8], // diagonal principal
      [2, 4, 6]  // diagonal secundaria
    ];

    String winner = '';

    // Verificar cada combinación ganadora
    for (var combination in winningCombinations) {
      int a = combination[0];
      int b = combination[1];
      int c = combination[2];

      if (roomDataProvider.displayElements[a].isNotEmpty &&
          roomDataProvider.displayElements[a] == roomDataProvider.displayElements[b] &&
          roomDataProvider.displayElements[a] == roomDataProvider.displayElements[c]) {
        winner = roomDataProvider.displayElements[a];
        break;
      }else if(roomDataProvider.filledBoxes == 9){
        winner = '';
        break;
      }
    }

    if(winner != ''){
      if(roomDataProvider.player1.playerType == winner){
        socketClient.emit('wiiner',{
           'winnerSocketId': roomDataProvider.player1.socketID,
           'roomId': roomDataProvider.roomData['_id'],
        });
      }else{
        socketClient.emit('wiiner',{
           'winnerSocketId': roomDataProvider.player2.socketID,
           'roomId': roomDataProvider.roomData['_id'],
        });
      }
    }
  }
}
