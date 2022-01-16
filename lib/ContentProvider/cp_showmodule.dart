import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CPCourseMgmt extends StatefulWidget {
  const CPCourseMgmt({Key? key}) : super(key: key);

  @override
  State<CPCourseMgmt> createState() => _CPCourseMgmtState();
}

class _CPCourseMgmtState extends State<CPCourseMgmt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iTutorPocket'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
              //children: [],
              ),
        ),
      ),
    );
  }
}
