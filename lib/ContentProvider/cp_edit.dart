import 'package:flutter/material.dart';

import 'package:project_test/Models/coursemodel_new.dart';

class CPEditContent extends StatefulWidget {
  CPEditContent({Key? key, required this.content, required this.db})
      : super(key: key);
  Map content;
  Database db;

  @override
  _CPEditContentState createState() => _CPEditContentState();
}

class _CPEditContentState extends State<CPEditContent> {
  TextEditingController moduleController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moduleController.text = widget.content['module'];
    titleController.text = widget.content['title'];
    descController.text = widget.content['description'];
    urlController.text = widget.content['url'];
    print(widget.content['title']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent.shade400,
      appBar: AppBar(
        title: Text('Edit Content'),
        actions: [
          IconButton(
              onPressed: () => {
                    widget.db.delete(
                      widget.content['id'],
                      course: widget.content['course'],
                      module: widget.content['module'],
                    ),
                    Navigator.pop(context, true)
                  },
              icon: Icon(Icons.delete)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                enabled: false,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.black87),
                  labelText: 'Module',
                  filled: true,
                  fillColor: Colors.grey.shade300,
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
              SizedBox(height: 30),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration('Title'),
                controller: titleController,
              ),
              SizedBox(height: 30),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: inputDecoration('Description'),
                controller: descController,
              ),
              SizedBox(height: 30),
              TextFormField(
                style: TextStyle(color: Colors.black),
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
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width / 2.5,
              child: const Text('Cancel'),
              onPressed: () => {Navigator.of(context).pop()},
            ),
            MaterialButton(
              color: Colors.yellow.shade400,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              minWidth: MediaQuery.of(context).size.width / 2.5,
              child: const Text('Save Changes'),
              onPressed: () {
                widget.db.update(widget.content['id'],
                    course: widget.content['course'],
                    module: moduleController.text,
                    title: titleController.text,
                    description: descController.text,
                    url: urlController.text);
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
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black.withAlpha(25),
          width: 4.0,
        ),
      ),
    );
  }
}
