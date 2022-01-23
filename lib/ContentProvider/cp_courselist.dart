import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_test/ContentProvider/cp_add.dart';
import 'package:project_test/ContentProvider/cp_edit.dart';
import 'package:project_test/Models/contentprovider_model.dart';
import 'package:project_test/Models/coursemodel_new.dart';
//import 'package:project_test/bottom_navigation.dart';
import 'package:project_test/library/courselib.dart' as courselib;

class CPCourseList extends StatefulWidget {
  const CPCourseList({Key? key}) : super(key: key);

  @override
  _CPCourseListState createState() => _CPCourseListState();
}

class _CPCourseListState extends State<CPCourseList> {
  Database db = Database();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'add',
        onPressed: () => {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CPAddContent(db: db)))
              .then((value) => {
                    if (value != null) {initialise()}
                  })
        },
      ),
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              contentPadding: EdgeInsets.only(right: 30, left: 36),
              title: Text(docs[index]['title']),
              subtitle: Text(docs[index]['description']),
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
      ),
    );
  }
}
