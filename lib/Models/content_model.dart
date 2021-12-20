import 'package:flutter/material.dart';

class ContentModel extends ChangeNotifier {
  String _uid = '';
  String get uid=> _uid;

  String? description;
  String? title;
  String? url;

  ContentModel({this.description, this.title, this.url});

  //receiving data from server
  factory ContentModel.fromMap(map)
  {
    return ContentModel(
      description: map['description'],
      title: map['title'],
      url: map['url'],
    );
  }

  void uidSetter(String uid) {
    _uid = uid;
  }
}