import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_test/Models/coursemodel_new.dart';
import 'dart:async';
import 'package:project_test/main.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  
//   Future<List<CourseModel>> getCourse() async {
//     var courseFirebase = await FirebaseFirestore.instance.collection("course").get().then()

//     var jsonData = json.decode(courseFirebase);
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Title'),
//       ),
//       body: ,
//     );
//   }
// }












// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Title'),
//       ),
//       body: ListPage(),
//     );
//   }
// }

// class ListPage extends StatefulWidget {
//   const ListPage({Key? key}) : super(key: key);

//   @override
//   _ListPageState createState() => _ListPageState();
// }

// class _ListPageState extends State<ListPage> {
//   var qnL;
//   @override
//   void initState() {
//     qnL = 0;
//     super.initState();
//   }

//   Future getPosts() async {
//     var firestore = FirebaseFirestore.instance;
//     var qn = firestore
//         .collection("course")
//         .doc('ICT')
//         .collection('module')
//         .doc('C++')
//         .collection('content')
//         .get();

//     return qn;
//   }

//   navigateToDetail(AsyncSnapshot post) {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => DetailPage(post: post)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: getPosts(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: Text('Loading ...'),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data.docs.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(snapshot.data.docs[index]['title']),
//                   onTap: () => navigateToDetail(snapshot.data[index]),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class DetailPage extends StatefulWidget {
//   //const DetailPage({Key? key}) : super(key: key);

//   var post;
//   DetailPage({Key? key, required this.post}) : super(key: key);

//   @override
//   _DetailPageState createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: widget.post['title'],
//       ),
//       body: Container(
//         child: Card(
//           child: ListTile(
//             title: Text(widget.post['title']),
//             subtitle: Text(widget.post['description']),
//           ),
//         ),
//       ),
//     );
//   }
// }
