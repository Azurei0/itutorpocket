import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:project_test/Models/coursemodule_model.dart';

class CPAddModuleContent extends StatefulWidget {
  const CPAddModuleContent({Key? key}) : super(key: key);

  @override
  _CPAddModuleContentState createState() => _CPAddModuleContentState();
}

class _CPAddModuleContentState extends State<CPAddModuleContent> {
  //var firebaseUser = FirebaseAuth.instance.currentUser;
  var firestoreInstance = FirebaseFirestore.instance;
  var _selectedCourse;
  Text hintText = Text("Choose The Module's Course");
  final _formKey = GlobalKey<FormState>();
  List<String> courseList = ["ICT", "ENGINEER", "LAW", "ARCHITECTURE"];

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final urlController = TextEditingController();
  final moduleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final courseDropdown = DropdownButton<String>(
      value: _selectedCourse,
      hint: hintText,
      items: courseList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedCourse = newValue;
        });
        log(_selectedCourse.toString());
      },
      autofocus: true,
      icon: const Icon(Icons.arrow_drop_down_circle),
      isExpanded: true,
    );

    final moduleField = TextFormField(
      autofocus: false,
      controller: moduleController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        moduleController.value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.subject),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Parent Module Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final titleField = TextFormField(
      autofocus: false,
      controller: titleController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        titleController.value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.title),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Title',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final descriptionField = TextFormField(
      autofocus: false,
      controller: descriptionController,
      keyboardType: TextInputType.multiline,
      minLines: 3,
      maxLines: 5,
      onSaved: (value) {
        descriptionController.value;
      },
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.description),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Description',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final urlField = TextFormField(
      autofocus: false,
      controller: urlController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        urlController.value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.web),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Content/Video Url',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final confirmAddModuleButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.yellow,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 2.5,
          child: const Text("Confirm Add"),
          onPressed: () {
            cpConfirmAddContent(
                _selectedCourse,
                titleController.text,
                moduleController.text,
                descriptionController.text,
                urlController.text);
          }),
    );

    final cancelAddModuleButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.red.shade400,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 2.5,
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Module"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 45,
              ),
              const SizedBox(height: 45),
              courseDropdown,
              const SizedBox(height: 45),
              moduleField,
              const SizedBox(height: 45),
              titleField,
              const SizedBox(height: 45),
              descriptionField,
              const SizedBox(height: 45),
              urlField,
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelAddModuleButton,
                  confirmAddModuleButton,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  cpConfirmAddContent(String course, String module, String title, String desc,
      String urllink) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;

    courseModuleModel modulemodel = courseModuleModel();

    modulemodel.course = _selectedCourse;
    modulemodel.module = moduleController.text;
    modulemodel.title = titleController.text;
    modulemodel.description = descriptionController.text;
    modulemodel.url = urlController.text;
    modulemodel.authoruid = firebaseUser!.uid;
    modulemodel.authorname = firebaseUser.displayName;

    firestoreInstance
        .collection("course")
        .doc(course)
        .collection("module")
        .doc(module)
        .collection("content")
        .doc(firebaseUser.uid)
        .set(modulemodel.toMap());

    Navigator.of(context).pop();
  }
}
