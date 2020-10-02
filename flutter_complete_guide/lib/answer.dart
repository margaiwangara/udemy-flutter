import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final Function answerHandler;

  Answer(this.answer, this.answerHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(answer),
        onPressed: answerHandler,
      ),
    );
  }
}
