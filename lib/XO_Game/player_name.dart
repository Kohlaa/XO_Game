import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/XO_Game/game_board.dart';

class playerName extends StatelessWidget {
  static const String routeName = 'player-name';
  String player1Name = "", player2Name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To XO Game'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Player 1 Name"),
              onChanged: (String text) {
                player1Name = text;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Player 2 Name"),
              onChanged: (String text) {
                player2Name = text;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(GameBoardScreen.routeName,
                      arguments: GameBoardArgs(
                          player1Name: player1Name, player2Name: player2Name));
                },
                child: Text("Let's Play"))
          ],
        ),
      ),
    );
  }
}
