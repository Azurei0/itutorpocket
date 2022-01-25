import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_test/Models/contentprovider_model.dart';

class CPHomePage extends StatefulWidget {
  const CPHomePage({Key? key}) : super(key: key);

  @override
  _CPHomePageState createState() => _CPHomePageState();
}

class _CPHomePageState extends State<CPHomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  CPModel loggedIn = CPModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("iTutorPocket"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
