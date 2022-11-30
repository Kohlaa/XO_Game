import 'package:flutter/material.dart';
import 'package:xo_game/XO_Game/game_board.dart';
import 'package:xo_game/XO_Game/player_name.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      GameBoardScreen.routeName: (context) => GameBoardScreen(),
      playerName.routeName: (context) => playerName(),
    },
    initialRoute: playerName.routeName,
  ));
}
