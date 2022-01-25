import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_test/ContentProvider/cp_botnavigation.dart';
import 'package:project_test/ContentProvider/cp_courselist.dart';
import 'package:project_test/ContentProvider/cp_edit.dart';
import 'package:project_test/ContentProvider/cp_minicourselist.dart';
import 'package:project_test/Models/contentprovider_model.dart';
import 'package:project_test/Models/coursemodel_new.dart';

class CPHomePage extends StatefulWidget {
  const CPHomePage({Key? key}) : super(key: key);

  @override
  _CPHomePageState createState() => _CPHomePageState();
}

class _CPHomePageState extends State<CPHomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  Database db = Database();
  CPModel loggedIn = CPModel();
  List docs = [];
  initialise() {
    db = Database();
    db.initialize();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.email)
        .get()
        .then((value) => {loggedIn = CPModel.fromMap(value.data())});
  }

  static const String _title = 'iTutorPocket';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 245, 200, 64),
      ),
      title: _title,
      home: const CPBotNavigationWidget(),
    );
  }
}
