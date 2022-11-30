import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameBoardButton extends StatelessWidget {
  String text;
  Function onBtnClckCallBack;
  int index;

  GameBoardButton(
      {required this.text,
      required this.onBtnClckCallBack,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(5),
            child: ElevatedButton(
                onPressed: () {
                  onBtnClckCallBack(index);
                },
                child: Text('$text'))));
  }
}
