import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Question Index: $_questionIndex');
    print('Total Score: $_totalScore');
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'score': 70, 'answer': 'Black'},
          {'score': 20, 'answer': 'Green'},
          {'score': 30, 'answer': 'Blue'},
          {'score': 50, 'answer': 'Orange'}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'score': 10, 'answer': 'Dog'},
          {'score': 25, 'answer': 'Cat'},
          {'score': 35, 'answer': 'Horse'},
          {'score': 40, 'answer': 'Tortoise'}
        ]
      }
    ];

    void _resetQuiz() {
      setState(() {
        _questionIndex = 0;
        _totalScore = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
