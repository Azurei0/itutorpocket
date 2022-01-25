import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_test/Models/database_engineering.dart';


class EContentPage2 extends StatefulWidget {
  const EContentPage2({Key? key, required this.title, required this.dBContent}) : super(key: key);
  final Map title;
  final EDatabase dBContent;

  @override
  _EContentPage2State createState() => _EContentPage2State();
}

class _EContentPage2State extends State<EContentPage2> {

  String? title;
  String? module;
  String? desc;
  String? url;

  @override
  void initState() {
    super.initState();
    title = widget.title['title'];
    module = widget.title['module'];
    desc = widget.title['description'];
    url = widget.title['url'];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: const Text("PROGRAMMING", style: TextStyle(color: Colors.black,),),
        backgroundColor: Colors.yellowAccent,centerTitle: true,),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                alignment: Alignment.topCenter,
                child:Text('$title',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),),),
              const SizedBox(height: 10,),
              Container(
                child: Text('$module',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),),
              ),
              const SizedBox(height: 50,),

              Container(
                width: 500,
                height: 200,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Text('$desc',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),),
                    const SizedBox(height: 20,),
                    Text('$url',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              //const SizedBox(height: 20,),
              //FavoriteButton(isFavorite: false, valueChanged: (_isFavorite) {print(ContentPage2);},),

            ],)
      ),
    );
  }

}



