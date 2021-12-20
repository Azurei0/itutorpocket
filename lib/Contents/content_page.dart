import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:page_transition/page_transition.dart';
//import 'package:project_test/Models/content_model.dart';

//import 'content_page2.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);
  @override
  ContentPageState createState() => ContentPageState();
}

class ContentPageState extends State<ContentPage> {
  final ScrollController _controller = ScrollController();

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
    var stream = FirebaseFirestore.instance.collection('course')
        .doc('ICT')
        .collection('module')
        .doc('C++')
        .collection('CTSZO4YSA2Szti8zSCQXL3Q2Gnn1')
        .snapshots();
    
    //var onTap = ContentModel();

    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
      {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return center("Please wait...");

          default:
            if(snapshot.hasData) {
              if(snapshot.data!.docs.isEmpty) {
                return center ('No contents');
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _controller,
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    //String id = snapshot.data!.docs[index].id;
                    String title = snapshot.data!.docs[index]['title'];
                    String desc = snapshot.data!.docs[index]['description'];
                    String url = snapshot.data!.docs[index]['url'];
                    return content('$title \n$desc \n$url');
                  },
                );
              }
            } else {
              return center ('Error');
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

  Widget content(String id) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 1.0, 1.0, 1.0),
            height: 150, width: 373, color: Colors.white,
            child: Text(id,
              style: const TextStyle(
                height: 2.5,
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),),
          ),
        ),
      ],
    );
  }


}