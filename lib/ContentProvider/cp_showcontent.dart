import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_test/ContentProvider/cp_addcontentpage.dart';

class CPShowModuleContent extends StatefulWidget {
  const CPShowModuleContent({Key? key}) : super(key: key);

  @override
  _CPShowModuleContentState createState() => _CPShowModuleContentState();
}

class _CPShowModuleContentState extends State<CPShowModuleContent> {
  //   final CPmoduleContentWidget = FutureBuilder<QuerySnapshot>(
  //   future: FirebaseFirestore.instance.collection("course").doc("ICT").collection("module").doc("C++").collection(firebaseUser!.uid).get(),
  //   initialData: InitialData,
  //   builder: (BuildContext context, AsyncSnapshot snapshot) {
  //     return ;
  //   },
  // ),

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    var firestoreInstance = FirebaseFirestore.instance;
    var ictCourseRef = firestoreInstance.collection("course").doc("ICT");
    var ictcppModuleRef = ictCourseRef
        .collection("module")
        .doc("C++")
        .collection(firebaseUser!.uid);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "C++",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Positioned(
              child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CPAddModuleContent()));
                  }),
            ),
          ),
        )

        // Container(
        //   alignment: Alignment.center,
        //   child: FutureBuilder<QuerySnapshot>(
        //     future: ictcppModuleRef.get(),
        //     //initialData: InitialData,
        //     builder:
        //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //       if (snapshot.hasData) {
        //         final List<DocumentSnapshot> modulesnapshot = snapshot.data!.docs;
        //         return ListView(
        //             children: modulesnapshot
        //                 .map(
        //                   (doc) => Card(
        //                     child: ListTile(
        //                       title: Text(doc['title']),
        //                       subtitle: Text(doc['description']),
        //                     ),
        //                   ),
        //                 )
        //                 .toList());
        //       } else if (!snapshot.hasData) {
        //         return Text('No data');
        //       } else if (snapshot.hasError) {
        //         // try {} catch (e) {
        //         //   debugPrint(e.toString());
        //         return Text('Error loading items');
        //         //}
        //       }
        //     },
        //   ),
        // ),
        );
  }
}
