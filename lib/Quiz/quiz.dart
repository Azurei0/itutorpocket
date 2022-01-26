import 'package:flutter/material.dart';
import 'quiz_question.dart';
import 'quiz_answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> data;
  final int indexQuestion;
  final Function answerQuestion;

  const Quiz(
        {required this.data,
        required this.answerQuestion,
        required this.indexQuestion,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: 360,
              child: QuizQuestion(
                data[indexQuestion]['questionText'] as String,
              ),
            )),
        ...(data[indexQuestion]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return QuizAnswer(
                  () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList(),
      ],
    );
  }
}