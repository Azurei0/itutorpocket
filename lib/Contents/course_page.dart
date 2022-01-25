
import 'package:flutter/material.dart';
import 'package:project_test/Contents/module_quiz.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
  }

class _CoursePageState extends State<CoursePage> {

  bool isButtonEnable = true;
  bool clicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //appBar: AppBar(title: const Text("ICT", style: TextStyle(color: Colors.black,),), backgroundColor: Colors.yellowAccent, centerTitle: true,),

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if(isButtonEnable == false) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ModuleQuiz()));}
                    },
                    color: Colors.yellow,
                    child: const Text(
                      'Programming',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15,),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.yellow,
                    child: const Text(
                      'UI Design',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15,),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.yellow,
                    child: const Text(
                      'Digital Media Design', textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15,),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.yellow,
                    child: const Text(
                      'Enterprise Management Technology', textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15,),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.yellow,
                    child: const Text(
                      'Information Assurance and Security', textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 190,),
                ElevatedButton(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      'ENROLL',
                      textAlign: TextAlign.center,
                      style: clicked ? const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black) : const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellowAccent,
                    onSurface: Colors.grey,
                  ),
                  onPressed: isButtonEnable ? (){setState(() {
                    isButtonEnable = false;
                    clicked = !clicked;
                  });} : null,
                ),
              ],
            ),
          ),
        ),
      ),
      );
  }
}