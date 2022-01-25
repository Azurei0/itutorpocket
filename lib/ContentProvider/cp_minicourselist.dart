import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_test/ContentProvider/cp_add.dart';
import 'package:project_test/ContentProvider/cp_edit.dart';
import 'package:project_test/Models/contentprovider_model.dart';
import 'package:project_test/Models/coursemodel_new.dart';
//import 'package:project_test/bottom_navigation.dart';
import 'package:project_test/library/courselib.dart' as courselib;

class CPMiniCourseList extends StatefulWidget {
  const CPMiniCourseList({Key? key}) : super(key: key);

  @override
  _CPMiniCourseListState createState() => _CPMiniCourseListState();
}

class _CPMiniCourseListState extends State<CPMiniCourseList> {
  Database db = Database();
  List docs = [];
  initialise() async {
    db = Database();
    db.initialize();
    await db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    int index = 2;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            contentPadding: const EdgeInsets.only(right: 30, left: 36),
            title: Text(docs[index]['title']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(docs[index]['description']),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(docs[index]['module']),
                    Text(docs[index]['course']),
                  ],
                )
              ],
            ),
            onTap: () => {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CPEditContent(content: docs[index], db: db)))
                  .then((value) => {
                        if (value != null) {initialise()}
                      })
            },
            // TODO button on arrow press
            trailing: const Icon(
              Icons.arrow_right,
              size: 35,
            ),
          ),
        );
      },
    );
  }
}
