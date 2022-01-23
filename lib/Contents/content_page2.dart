import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContentPage2 extends StatefulWidget {
  const ContentPage2({Key? key}) : super(key: key);

  @override
  _ContentPage2State createState() => _ContentPage2State();
}

class _ContentPage2State extends State<ContentPage2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: const Text("C++", style: TextStyle(color: Colors.black,),),
        backgroundColor: Colors.yellowAccent,centerTitle: true,),
      body: body(),
    );
  }

  Widget body() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('course')
          .doc('ICT')
          .collection('module')
          .doc('C++')
          .collection('CTSZO4YSA2Szti8zSCQXL3Q2Gnn1')
          .snapshots(),

      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return center("Please wait...");

          default:
            if(snapshot.hasData) {
              print(snapshot.data!.docs.length);
              if (snapshot.data!.docs.isEmpty) {
                return center('No Content Found');
              }else{
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index){
                      String title = snapshot.data!.docs[index]['title'];
                      String desc = snapshot.data!.docs[index]['description'];
                      String url = snapshot.data!.docs[index]['url'];

                      return Text('$title \n$desc \n$url');
                    });
              }
            }else{
              return center('Getting Error');
            }
        }
      },

    );
  }

  Widget center(String text) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      child: Text (
        text, style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: Colors.black.withOpacity(0.56),
      ),
      ),
    );
  }
}
