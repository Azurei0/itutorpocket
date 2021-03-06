import 'package:cloud_firestore/cloud_firestore.dart';

class EDatabase {

  late FirebaseFirestore firestore;
  initialize() {
    firestore = FirebaseFirestore.instance;
  }
  Future<List> dBContent() async {
    QuerySnapshot querySnapshot;
    List docs=[];
    try{
      querySnapshot = await firestore.collection('ENGINEERING').get();
      if(querySnapshot.docs.isNotEmpty) {
        for(var doc in querySnapshot.docs.toList()) {
          Map cont = {
            'id': doc.id,
            'title':doc['title'],
            'module':doc['module'],
            'description':doc['description'],
            'url':doc['url'],
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