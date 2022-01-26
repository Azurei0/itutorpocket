import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var cpUser = FirebaseAuth.instance.currentUser;
  initialize() {}

  Future<void> addContent({
    String? course,
    String? module,
    String? title,
    String? description,
    String? url,
    String? authoruid,
    String? authorname,
  }) async {
    try {
      await firestore.collection('coursenew').add({
        'course': course,
        'module': module,
        'title': title,
        'description': description,
        'url': url,
        'authoruid': authoruid,
        'authorname': authorname,
      });
      // var coursetoCPRef = firestore.collection('coursetoCP').doc(course);

      // await coursetoCPRef.update({
      //   'cpList': FieldValue.arrayUnion([cpUser!.uid])
      // }).catchError((e) => coursetoCPRef.set({
      //       'cpList': FieldValue.arrayUnion([cpUser!.uid]),
      //       'courseName': course
      //     }));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore
          .collection('coursenew')
          .where('authoruid', isEqualTo: cpUser!.uid)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            'id': doc.id,
            'course': doc['course'],
            'module': doc['module'],
            'title': doc['title'],
            'description': doc['description'],
            'url': doc['url'],
            'authoruid': doc['authoruid'],
            'authorname': doc['authorname']
          };
          docs.add(a);
        }
        //return docs;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return docs;
  }

  void update(
    String id, {
    String? course,
    String? module,
    String? title,
    String? description,
    String? url,
  }) async {
    try {
      await firestore.collection('coursenew').doc(id).update({
        'course': course,
        'title': title,
        'description': description,
        'url': url,
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> delete(
    String id, {
    String? course,
    String? module,
  }) async {
    try {
      await firestore.collection('coursenew').doc(id).delete();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

class CourseModel {
  String? course;
  String? module;
  String? title;
  String? description;
  String? url;
  String? authoruid;
  String? authorname;

  CourseModel(
      {this.course,
      this.module,
      this.title,
      this.description,
      this.url,
      this.authoruid,
      this.authorname});

  // receive data
  factory CourseModel.fromMap(map) {
    return CourseModel(
        course: map['course'],
        module: map['module'],
        title: map['title'],
        description: map['description'],
        url: map['url'],
        authoruid: map['authoruid'],
        authorname: map['authorname']);
  }

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      course: json['course'] as String,
      module: json['module'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      authoruid: json['authoruid'] as String,
      authorname: json['authorname'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'course': course,
      'module': module,
      'title': title,
      'description': description,
      'url': url,
      'authoruid': authoruid,
      'authorname': authorname,
    };
  }
}
