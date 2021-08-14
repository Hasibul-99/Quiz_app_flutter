import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _MyAppState();
    }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
      {
        'questionText': "What's your favorite color",
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'White', 'score': 7},
          {'text': 'Blue', 'score': 5},
          {'text': 'red', 'score': 3}
        ]
      },
      {
        'questionText': "What's Your favorite animal",
        'answers': [
          {'text': 'Dog', 'score': 10},
          {'text': 'Cat', 'score': 7},
          {'text': 'Tigher', 'score': 5},
          {'text': 'Lion', 'score': 3}
        ]
      },
      {
        'questionText': "What's Your favorite",
        'answers': [
          {'text': 'A', 'score': 10},
          {'text': 'B', 'score': 7},
          {'text': 'U', 'score': 5},
          {'text': 'P', 'score': 3}
        ]
      },
  ];
  var _totalScore = 0;

  void _answerQuestion(int Score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
    _totalScore = _totalScore + Score;
  }

  void _resetQuiz() {
    setState(() { 
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text("My First App"),),
      body: _questionIndex < _questions.length ?
         Quiz(
           answerQuestion: _answerQuestion, 
           questionIndex: _questionIndex,
           questions: _questions,
         ) : Result(_totalScore, _resetQuiz)
    ), );
  }
}