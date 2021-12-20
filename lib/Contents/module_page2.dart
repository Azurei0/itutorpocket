import 'package:flutter/material.dart';
import 'package:project_test/Contents/content_page.dart';


class ModulePage2 extends StatefulWidget {
  const ModulePage2({Key? key}) : super(key: key);

  @override
  _ModulePage2State createState() => _ModulePage2State();
}

class _ModulePage2State extends State<ModulePage2> {

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
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const ContentPage()));
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
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 230,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.grey,
                    child: const Text(
                      'ENROLLED',
                      style: TextStyle(fontSize: 20, color: Colors.black,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}