import 'package:flutter/material.dart';
import 'package:project_test/Contents/content_page.dart';
import 'package:project_test/Quiz/quiz_main.dart';

class ModuleQuiz extends StatefulWidget {
  const ModuleQuiz({Key? key}) : super(key: key);

  @override
  _ModuleQuizState createState() => _ModuleQuizState();
}

class _ModuleQuizState extends State<ModuleQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: const Text("PROGRAMMING", style: TextStyle(color: Colors.black,),),
        backgroundColor: Colors.yellowAccent,centerTitle: true,),

        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.greenAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 45),
                      Container(
                        //clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                        height: 100,
                        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),),
                        child: MaterialButton(
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const ContentPage()));
                          },
                          color: Colors.white,
                          child: const Text(
                            'MODULE',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),
                      Container(
                        //clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                        height: 100,
                        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),),
                        child: MaterialButton(
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuizMain()));},
                          color: Colors.white,
                          child: const Text(
                            ' START QUIZ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }
}
