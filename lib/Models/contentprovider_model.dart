import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CPModel {
  String? uid;
  String? email;
  String? username;
  String? userType;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var cpUser = FirebaseAuth.instance.currentUser;
  initialize() {}

  void updateUsername({
    String? username,
  }) async {
    try {
      await firestore.collection('user').doc(cpUser!.email).update(
        {'username': username},
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  CPModel({this.uid, this.email, this.username, this.userType});

  //receive data from server
  factory CPModel.fromMap(map) {
    return CPModel(
        uid: map['uid'],
        email: map['email'],
        username: map['username'],
        userType: map['userType']);
  }

  CPModel.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        email = data['email'],
        username = data['username'],
        userType = data['userType'];

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'userType': userType,
    };
  }
}

// class CPCourseAssoc {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   var cpUser = FirebaseAuth.instance.currentUser;
//   initialize() {}

//   Future<void> addCPCourse({String? course}) async {
//     var cpRef = firestore.collection('contentProvider').doc(cpUser!.uid);
//     await cpRef.update({
//       'course': FieldValue.arrayUnion([course])
//     }).catchError((e) => cpRef.set({
//           'course': FieldValue.arrayUnion([course])
//         }));
//   }

  // Future<List> getCPCourse() async {
  //   QuerySnapshot querySnapshot;
  //   var c2cpRef = firestore.collection('coursetoCP');
  //   List cpCourseList = [];
  //   try {
  //     querySnapshot =
  //         await c2cpRef.where('cpList', arrayContains: cpUser!.uid).get();
  //     if (querySnapshot.docs.isNotEmpty) {
  //       for (var doc in querySnapshot.docs.toList()) {
  //         Map a = {
  //           'course': doc['courseName'],
  //         };
  //         cpCourseList.add(a);
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  //   return cpCourseList;
  // }
  // }
