import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:project_test/Models/coursemodel_new.dart';

class CPAddContent extends StatefulWidget {
  CPAddContent({Key? key, required this.db}) : super(key: key);
  Database db;

  @override
  _CPAddContentState createState() => _CPAddContentState();
}

class _CPAddContentState extends State<CPAddContent> {
  User? cpUser = FirebaseAuth.instance.currentUser;
  TextEditingController courseController = TextEditingController();
  TextEditingController moduleController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  var courseList = [
    'LAW',
    'ARCHITECTURE',
    'EDUCATION',
    'ECONOMICS',
    'ICT',
    'ENGINEERING',
    'ISLAMIC REVEALED KNOWLEDGE',
    'HUMAN SCIENCES',
    'ALLIED HEALTH & SCIENCES',
    'MEDICINE',
    'NURSING',
    'SCIENCE',
    'PHARMACY',
    'DENTISTRY',
    'LANGUAGES AND MANAGEMENT',
  ];
  var _selectedCourse;

  @override
  void initState() {
    super.initState();
    courseList.sort((a, b) => // sorting courseList alphabetically
        a.toString().toUpperCase().compareTo(b.toString().toUpperCase()));
  }

  @override
  Widget build(BuildContext context) {
    final courseDropdown = DropdownButton<String>(
      value: _selectedCourse,
      underline: Container(),
      hint: const Text("Choose The Module's Course"),
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
      },
      borderRadius: BorderRadius.circular(25),
      autofocus: true,
      icon: const Icon(
        Icons.arrow_drop_down_circle,
      ),
      isExpanded: true,
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 147, 142),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 245, 200, 64),
        title: const Text('Add Content'),
        titleTextStyle: const TextStyle(
            fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black38, width: 2),
                ),
                child: Padding(
                  child: courseDropdown,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                enabled: true,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusColor: Colors.blue,
                  labelStyle: const TextStyle(color: Colors.black87),
                  labelText: 'Module',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black.withAlpha(25),
                      width: 3.0,
                    ),
                  ),
                ),
                controller: moduleController,
              ),
              const SizedBox(height: 30),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: inputDecoration('Title'),
                controller: titleController,
              ),
              const SizedBox(height: 30),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                minLines: 2,
                maxLines: 5,
                decoration: inputDecoration('Description'),
                controller: descController,
              ),
              const SizedBox(height: 30),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: inputDecoration('URL'),
                controller: urlController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              color: Colors.red.shade400,
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width / 2.5,
              child: const Text('Cancel'),
              onPressed: () => {Navigator.of(context).pop()},
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 245, 200, 64),
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width / 2.5,
              child: const Text('Add Content'),
              onPressed: () {
                widget.db.addContent(
                  course: _selectedCourse,
                  module: moduleController.text.toString().toUpperCase(),
                  title: titleController.text,
                  description: descController.text,
                  url: urlController.text,
                  authoruid: cpUser!.uid,
                  authorname: cpUser!.displayName,
                );
                Navigator.pop(context, true);
              },
            )
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.blue,
      labelStyle: TextStyle(color: Colors.black87),
      labelText: labelText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black.withAlpha(25),
          width: 2.0,
        ),
      ),
    );
  }
}
