import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// tak pakai
class ContentStreamWidget extends StatefulWidget {
  ContentStreamWidget({Key? key, contentDocsReference}) : super(key: key);
  final contentDocsReference = FirebaseFirestore.instance
      .collection('course')
      .doc('ICT')
      .collection('module')
      .doc('C++')
      .collection('content')
      .where('authoruid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get()
      .asStream();
  @override
  _ContentStreamWidgetState createState() => _ContentStreamWidgetState();
}

class _ContentStreamWidgetState extends State<ContentStreamWidget> {
  final ScrollController _controller = ScrollController();
  var cpContentStream;

  @override
  void initState() {
    cpContentStream = widget.contentDocsReference;
    super.initState();
  }

  deleteCPContent({contentTitle}) {
    var firestoreInstance = FirebaseFirestore.instance;
    var deleteRef = firestoreInstance
        .collection('course')
        .doc('ICT')
        .collection('module')
        .doc('C++')
        .collection('content')
        .doc(contentTitle)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: cpContentStream,
      initialData: cpContentStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No Content Found'));
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _controller,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    String contentTitle = snapshot.data!.docs[index]['title'];
                    String contentDesc =
                        snapshot.data!.docs[index]['description'];
                    String authoruid = snapshot.data!.docs[index]['authoruid'];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      borderOnForeground: true,
                      color: Colors.orange.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(contentTitle),
                            Text(contentDesc),
                            Text(authoruid),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.edit_rounded)),
                                IconButton(
                                    onPressed: deleteCPContent,
                                    icon: const Icon(Icons.delete_rounded))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
            if (snapshot.hasError) {
              return const Text('Error Loading Data');
            }
            return const SizedBox(
              height: 0,
            );
        }
      },
    );
  }
}

// Widget contentViewWidget() {
//     // Future<QuerySnapshot<Map<String, dynamic>>>

//     var firebaseUser;
//     var byUidContentRef = FirebaseFirestore.instance
//         .collection('course')
//         .doc('ICT')
//         .collection('module')
//         .doc('C++')
//         .collection('content')
//         .where('authoruid', isEqualTo: firebaseUser!.uid)
//         .snapshots()
//         .toList();

//     return StreamBuilder(
//       stream: contentDocsReference,
//       initialData: contentDocsReference,
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//           case ConnectionState.waiting:
//             return const Center(child: CircularProgressIndicator());
//           default:
//             if (snapshot.hasData) {
//               if (snapshot.data!.docs.isEmpty) {
//                 return const Center(child: Text('No Content Found'));
//               } else {
//                 return ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   controller: _controller,
//                   shrinkWrap: true,
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     String contentTitle = snapshot.data!.docs[index]['title'];
//                     String contentDesc =
//                         snapshot.data!.docs[index]['description'];
//                     String authoruid = snapshot.data!.docs[index]['authoruid'];
//                     return Card(
//                       margin: const EdgeInsets.all(10),
//                       borderOnForeground: true,
//                       color: Colors.orange.shade50,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Text(contentTitle),
//                             Text(contentDesc),
//                             Text(authoruid),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 IconButton(
//                                     onPressed: null,
//                                     icon: Icon(Icons.edit_rounded)),
//                                 IconButton(
//                                     onPressed: deleteCPContent(
//                                         contentTitle: snapshot
//                                             .data!.docs[index]['title']
//                                             .toString()),
//                                     icon: const Icon(Icons.delete_rounded))
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }
//             }
//             if (snapshot.hasError) {
//               return const Text('Error Loading Data');
//             }
//             return const SizedBox(
//               height: 0,
//             );
//         }
//       },
//     );