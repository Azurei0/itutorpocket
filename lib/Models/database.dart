import 'package:cloud_firestore/cloud_firestore.dart';

class Database {

  late FirebaseFirestore firestore;
  initialize() {
    firestore = FirebaseFirestore.instance;
  }
  Future<List> dBContent(String courseName) async {
    QuerySnapshot querySnapshot;
    List docs=[];
    try{
      querySnapshot = await firestore.collection('coursenew')
          .where('course', isEqualTo: courseName)
          .get();
      if(querySnapshot.docs.isNotEmpty) {
        for(var doc in querySnapshot.docs.toList()) {
          Map cont = {
            'id': doc.id,
            'title':doc['title'],
            'module':doc['module'],
            'description':doc['description'],
            'url':doc['url'],
            'course':doc['course'],
          };
          docs.add(cont);
        }
        return docs;
      }
    }
    catch (e) {
      print(e);
    } return docs;
  }
}