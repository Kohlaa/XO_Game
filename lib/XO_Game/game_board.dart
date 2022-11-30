import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/XO_Game/game_board_buttun.dart';

class GameBoardScreen extends StatefulWidget {
  static const String routeName = "game-board";

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  List<String> boardState = ["", "", "", "", "", "", "", "", ""];
  int player1Score = 0, player2Score = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("XO Game"),
        leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${args.player1Name}(X)",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("$player1Score",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${args.player2Name}(O)",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("$player2Score",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardButton(
                    text: boardState[0],
                    index: 0,
                    onBtnClckCallBack: onBtnClck),
                GameBoardButton(
                    text: boardState[1],
                    index: 1,
                    onBtnClckCallBack: onBtnClck),
                GameBoardButton(
                    text: boardState[2], index: 2, onBtnClckCallBack: onBtnClck)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardButton(
                    text: boardState[3],
                    index: 3,
                    onBtnClckCallBack: onBtnClck),
                GameBoardButton(
                    text: boardState[4],
                    index: 4,
                    onBtnClckCallBack: onBtnClck),
                GameBoardButton(
                    text: boardState[5], index: 5, onBtnClckCallBack: onBtnClck)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardButton(
                    text: boardState[6],
                    index: 6,
                    onBtnClckCallBack: onBtnClck),
                GameBoardButton(
                    text: boardState[7],
                    index: 7,
                    onBtnClckCallBack: onBtnClck),
                GameBoardButton(
                    text: boardState[8], index: 8, onBtnClckCallBack: onBtnClck)
              ],
            ),
          ),
        ],
      ),
    );
  }

  int cnt = 0;

  onBtnClck(int idx) {
    if (boardState[idx] != '') return;
    if (cnt % 2 == 0)
      boardState[idx] = 'X';
    else
      boardState[idx] = 'O';
    if (cheeckWinner("X")) {
      player1Score++;
      initBoard();
      setState(() {
        cnt = 0;
      });
    } else if (cheeckWinner("O")) {
      player2Score++;
      initBoard();
      setState(() {
        cnt = 0;
      });
    } else if (cnt == 8) {
      initBoard();
      setState(() {
        cnt = 0;
      });
    } else {
      setState(() {
        cnt++;
      });
    }
  }

  cheeckWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == boardState[i + 1] &&
          boardState[i + 2] == boardState[i] &&
          boardState[i] == symbol &&
          boardState[i].isNotEmpty) return true;
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) return true;
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) return true;
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) return true;
    return false;
  }

  void initBoard() {
    for (int i = 0; i < 9; i++) boardState[i] = '';
  }
}

class GameBoardArgs {
  String player1Name, player2Name;

  GameBoardArgs({required this.player1Name, required this.player2Name});
}
