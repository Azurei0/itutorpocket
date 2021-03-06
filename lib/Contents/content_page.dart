//import 'package:badges/badges.dart';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_test/Contents/content_page2.dart';
import 'package:project_test/Models/database.dart';
import 'package:project_test/library/courselib.dart';
import 'dart:async';
//import 'package:project_test/bookmark_page.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  //List<String> newTitle = nouns.take(5).toList();
  List<String> bookmarked = <String>[];
  List bookmarkList = [];

  late Database dBContent;
  List<Database> userCourse = <Database>[];

  List docs = [];
  initialize() {
    dBContent = Database();
    dBContent.initialize();
    dBContent.dBContent("ICT").then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 147, 142),
      appBar: AppBar(
        title: const Text(
          "MODULES",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 245, 200, 64),
        centerTitle: true,

        //actions: <Widget>[
        //Badge(
        //badgeContent: Text('${bookmarked.length}'),
        //toAnimate: false,
        //position: BadgePosition.topStart(),
        //child: IconButton(
        //icon: const Icon(Icons.bookmark),
        //onPressed: () => pushToFavoriteWordsRoute(context),
        //),
        // ),
        //],
      ),
      body: body(),
    );
  }

  Widget body() {
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (BuildContext context, int index) {
        String word = docs[index]['title'];
        bool newTitle = bookmarked.contains(word);

        return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContentPage2(
                            title: docs[index], dBContent: dBContent)));
              },
              contentPadding: const EdgeInsets.only(right: 30, left: 36),
              title: Text(
                docs[index]['title'],
                style: const TextStyle(fontSize: 20),
              ),
              trailing: Icon(
                newTitle ? Icons.bookmark : Icons.bookmark_border,
                color: newTitle ? Colors.black : null,
              ),
              onLongPress: () async {
                if (newTitle) {
                  bookmarked.remove(word);
                } else {
                  bookmarked.add(word);
                }
                setState(() {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BookmarkPage(bookmarkItems: bookmarked,)));
                });
              },
            ));
      },
    );
  }
  //Future pushToFavoriteWordsRoute(BuildContext context) {
  //return Navigator.of(context).push(
  //MaterialPageRoute(builder:
  //(BuildContext context) => BookmarkPage(bookmarkItems: bookmarked,))
  //);
  //}
}
