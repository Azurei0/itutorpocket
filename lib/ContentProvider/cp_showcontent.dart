import 'dart:developer';
// tak pakai
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_test/ContentProvider/cp_addcontentpage.dart';
import 'package:project_test/ContentProvider/cp_contentstream.dart';
import 'package:project_test/ContentProvider/cp_profilepage.dart';

class CPShowModuleContent extends StatefulWidget {
  const CPShowModuleContent({Key? key}) : super(key: key);

  @override
  _CPShowModuleContentState createState() => _CPShowModuleContentState();
}

class _CPShowModuleContentState extends State<CPShowModuleContent> {
  final CPUser = FirebaseAuth.instance.currentUser;
  final ScrollController _controller = ScrollController();
  final firebaseUser = FirebaseAuth.instance.currentUser;
  var firestoreInstance = FirebaseFirestore.instance;
  var contentDocsReference = FirebaseFirestore.instance
      .collection('course')
      .doc('ICT')
      .collection('module')
      .doc('C++')
      .collection('content')
      .where('authoruid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .asStream();

  // @override
  // void initState() {
  //   contentDocsReference = FirebaseFirestore.instance
  //       .collection('course')
  //       .doc('ICT')
  //       .collection('module')
  //       .doc('C++')
  //       .collection('content')
  //       .where('authoruid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   super.initState();
  // }

  deleteCPContent({contentTitle}) {
    var deleteRef = firestoreInstance
        .collection('course')
        .doc('ICT')
        .collection('module')
        .doc('C++')
        .collection('content')
        .doc(contentTitle);
  }

  toCPProfilePage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CPProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: this.duration!), () async {
    //   FirebaseApp firebaseapp = await Firebase.initializeApp();
    // });

    // var ictCourseRef = firestoreInstance.collection("course").doc("ICT");
    // var ictcppModuleRef = ictCourseRef
    //     .collection("module")
    //     .doc("C++")
    //     .collection(firebaseUser!.uid);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: toCPProfilePage, icon: const Icon(Icons.person))
        ],
        centerTitle: true,
        title: const Text(
          "Contents",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CPAddModuleContent()));
        },
      ),
      body: ContentStreamWidget(
        contentDocsReference: '$contentDocsReference',
        key: UniqueKey(),
      ),
    );
  }
}

  

    // return FutureBuilder(
    //   future: contentDocsReference,
    //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.none:
    //       case ConnectionState.waiting:
    //         return const Center(child: CircularProgressIndicator());
    //       default:
    //         if (snapshot.hasData) {
    //           if (snapshot.data!.docs.isEmpty) {
    //             return const Center(child: Text('No Content Found'));
    //           } else {
    //             return ListView.builder(
    //               scrollDirection: Axis.vertical,
    //               controller: _controller,
    //               shrinkWrap: true,
    //               itemCount: snapshot.data!.docs.length,
    //               itemBuilder: (context, index) {
    //                 String contentTitle = snapshot.data!.docs[index]['title'];
    //                 String contentDesc =
    //                     snapshot.data!.docs[index]['description'];
    //                 String authoruid = snapshot.data!.docs[index]['authoruid'];
    //                 return Card(
    //                   margin: const EdgeInsets.all(10),
    //                   borderOnForeground: true,
    //                   color: Colors.orange.shade50,
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Column(
    //                       children: [
    //                         Text(contentTitle),
    //                         Text(contentDesc),
    //                         Text(authoruid),
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.end,
    //                           children: [
    //                             IconButton(
    //                                 onPressed: null,
    //                                 icon: Icon(Icons.edit_rounded)),
    //                             IconButton(
    //                                 onPressed: deleteCPContent(
    //                                     contentTitle: snapshot.data!.docs[index]
    //                                         ['title']),
    //                                 icon: Icon(Icons.delete_rounded))
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               },
    //             );
    //           }
    //         }
    //         if (snapshot.hasError) {
    //           return const Text('Error Loading Data');
    //         }
    //         return const SizedBox(
    //           height: 0,
    //         );
    //     }
    //   },
    // );

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

// class CPContentList extends StatefulWidget {
//   const CPContentList({Key? key}) : super(key: key);

//   @override
//   _CPContentListState createState() => _CPContentListState();
// }

// class _CPContentListState extends State<CPContentList> {
//   late Future _data;
//   Future getContents() async {
//     var firestore = FirebaseFirestore.instance;
//     QuerySnapshot qn =
//         firestore.collection("course").get() as QuerySnapshot<Object?>;

//     return qn.docs;
//   }

//   navigateToDetail(DocumentSnapshot post) {
//     //Navigator.push(context, MaterialPageRoute(builder: () => DetailPage(post: post))));
//   }

//   @override
//   void initState() {
//     super.initState();
//     _data = getContents();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: FutureBuilder(
//             future: _data,
//             builder: (_, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 return ListView.builder(
//                     itemCount: 10,
//                     itemBuilder: (_, index) {
//                       return ListTile(
//                           //title: Text(snapshot.data[index].data["title"]),
//                           //onTap: () => navigateToDetail(snapshot.data[index].data),
//                           );
//                     });
//               }
//             }));
//   }
// }

// class DetailPage extends StatefulWidget {
//   final DocumentSnapshot post;
//   const DetailPage({Key? key, required this.post}) : super(key: key);

//   @override
//   _DetailPageState createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Card(
//         child: ListTile(
//             //title: Text(widget.post.data()["title"]),
//             //subtitle: Text(widget.post.data()["content"]),
//             ),
//       ),
//     );
//   }
// }