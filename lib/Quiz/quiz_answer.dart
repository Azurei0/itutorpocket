import 'package:flutter/material.dart';
//import 'package:hexcolor/hexcolor.dart';

class QuizAnswer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const QuizAnswer(this.selectHandler, this.answerText, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        width: 300,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 245, 200, 64))),
      onPressed: selectHandler,
    );
  }
}