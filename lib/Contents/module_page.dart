import 'package:flutter/material.dart';
import 'package:project_test/Contents/module_quiz.dart';
//import 'package:page_transition/page_transition.dart';


class ModulePage extends StatefulWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {

  bool isButtonEnable = true;
  bool clicked = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: const Text("PROGRAMMING", style: TextStyle(color: Colors.black,),),
        backgroundColor: Colors.yellowAccent,centerTitle: true,),

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
                    color: Colors.white,
                    child: const Text(
                      'C++',
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
                    color: Colors.white,
                    child: const Text(
                      'Java',
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
                    color: Colors.white,
                    child: const Text(
                      'Python', textAlign: TextAlign.left,
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
                    color: Colors.white,
                    child: const Text(
                      'Dart', textAlign: TextAlign.left,
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

  //void ButtonClicked() async {
    //setState(() {
     //isButtonEnable = false;
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ModuleQuiz()));});

}