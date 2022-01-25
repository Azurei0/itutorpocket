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
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 245, 200, 64),
        title: Text('iTutorPocket'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w600),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 245, 200, 64),
        child: Icon(
          Icons.add,
          color: Colors.black87,
          size: 40,
        ),
        tooltip: 'add',
        onPressed: () => {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CPAddContent(db: db)))
              .then((value) => {
                    if (value != null) {initialise()}
                  })
        },
      ),
      backgroundColor: Color.fromARGB(255, 42, 147, 142),
      body: ListView.builder(
        itemCount: docs.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(right: 30, left: 36, top: 15, bottom: 15),
              title: Text(docs[index]['title']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    docs[index]['description'],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(docs[index]['course']),
                      Text(docs[index]['module']),
                    ],
                  ),
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
      ),
    );
  }
}
