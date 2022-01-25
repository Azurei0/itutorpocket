import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CPCourseMgmt extends StatefulWidget {
  const CPCourseMgmt({Key? key}) : super(key: key);

  @override
  State<CPCourseMgmt> createState() => _CPCourseMgmtState();
}

class _CPCourseMgmtState extends State<CPCourseMgmt> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iTutorPocket'),
        centerTitle: true,
      ),
      body: const Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: CPCourseMgmt(),
        ),
      ),
    );
  }

  // Widget body() {
  //   var rootCourseRef = FirebaseFirestore.instance.collection('course');
  //   var stCourseRef = rootCourseRef.snapshots();

  //   return StreamBuilder(
  //     stream: stCourseRef,
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.none:
  //         case ConnectionState.waiting:
  //           return const Center(
  //               child: Align(
  //             alignment: Alignment.center,
  //             child: CircularProgressIndicator(),
  //           ));

  //         default:
  //           if (snapshot.hasData) {
  //             if (snapshot.data!.docs.isEmpty) {
  //               return const Center(child: Text('No Content'));
  //             } else {
  //               return ListView.builder(
  //                 scrollDirection: Axis.vertical,
  //                 controller: _controller,
  //                 physics: const ScrollPhysics(),
  //                 itemCount: snapshot.data!.docs.length,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   // String title = snapshot.data!.docs[index];
  //                   // String desc = snapshot.data!.docs[index];
  //                   // String url = snapshot.data!.docs[index];
  //                   // return center ('$title \n$desc \n$url');
  //                 },
  //               );
  //             }
  //           } else {
  //             return const Center(
  //               child: Text('Error'),
  //             );
  //           }
  //       }
  //     },
  //   );
  // }
}
