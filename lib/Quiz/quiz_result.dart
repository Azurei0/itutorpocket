import 'package:flutter/material.dart';
import 'package:project_test/Contents/module_quiz.dart';
import 'quiz_question.dart';

class QuizResult extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const QuizResult(this.resultScore, this.resetHandler, {Key? key}) : super(key: key);

  String get result {
    String resultText;
    final score = resultScore;

    if (score <= 10) {
      resultText =
      'Your score is $score/50';
    } else {
      resultText =
      'Your score is $score/50';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      width: 360,
                      child: QuizQuestion(
                        result,
                      ),
                    )),
                ElevatedButton(
                  child: const SizedBox(
                    width: 200,
                    child: Text(
                      'Try again',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white)),
                  onPressed: resetHandler,
                ),
                ElevatedButton(
                  child: const SizedBox(
                    width: 200,
                    child: Text(
                      'Home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white)),
                  onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ModuleQuiz()));},
                )
              ],
            )));
  }
}