import "package:flutter/material.dart";
import 'quiz.dart';
import 'quiz_result.dart';

class QuizMain extends StatefulWidget {
  const QuizMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizMain();
  }
}

class _QuizMain extends State<QuizMain> {
  static const _data = [
    {
      'questionText':
      'A user defined header file is included by following statement in general.',
      'answers': [
        {'text': '#include “file.h”', 'score': 10},
        {'text': '#include <file.h>', 'score': 0},
        {'text': '#include <file>', 'score': 0},
        {'text': '#include file.h', 'score': 0},
      ]
    },
    {
      'questionText':
      'Which is the storage specifier used to modify the member variable even though the class object is a constant object?',
      'answers': [
        {'text': 'auto', 'score': 0},
        {'text': 'register', 'score': 0},
        {'text': 'static', 'score': 0},
        {'text': 'mutable', 'score': 10},
      ]
    },
    {
      'questionText': 'Special symbol permitted with in the identifier name',
      'answers': [
        {'text': '#', 'score': 0},
        {'text': '@', 'score': 0},
        {'text': '_', 'score': 10},
        {'text': '.', 'score': 0}
      ]
    },
    {
      'questionText': 'What is the built in library function to compare two strings',
      'answers': [
        {'text': 'string_cmp()', 'score': 0},
        {'text': 'strcmp()', 'score': 10},
        {'text': 'equals()', 'score': 0},
        {'text': 'str_compare()', 'score': 0}
      ]
    },
    {
      'questionText': 'Choose the option not applicable for the constructor.',
      'answers': [
        {'text': 'Cannot be called explicitly.', 'score': 0},
        {'text': 'Cannot be overloaded.', 'score': 0},
        {'text': 'Cannot be overridden', 'score': 10},
        {'text': 'None of the above', 'score': 0}
      ]
    }
  ];

  var _indexQuestion = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _indexQuestion += 1;
    });
  }

  void _restart() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: const Color.fromARGB(255, 42, 147, 142),
          appBar: AppBar(title: const Text("QUIZ", style: TextStyle(color: Colors.black,),),
            backgroundColor: const Color.fromARGB(255, 245, 200, 64),centerTitle: true,),

          body: Align(
              alignment: Alignment.center,
              child: (_indexQuestion <= 4 && _indexQuestion >= 0)
                  ? Quiz(
                  answerQuestion: _answerQuestion,
                  indexQuestion: _indexQuestion,
                  data: _data)
                  : QuizResult(_totalScore, _restart))
    );
  }
}