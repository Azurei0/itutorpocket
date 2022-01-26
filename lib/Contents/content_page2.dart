import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:project_test/Contents/content_url.dart';
import 'package:project_test/Models/database.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentPage2 extends StatefulWidget {
  const ContentPage2({Key? key, required this.title, required this.dBContent})
      : super(key: key);
  final Map title;
  final Database dBContent;

  @override
  _ContentPage2State createState() => _ContentPage2State();
}

class _ContentPage2State extends State<ContentPage2> {
  String? title;
  String? module;
  String? desc;
  late String url;

  @override
  void initState() {
    super.initState();
    title = widget.title['title'];
    module = widget.title['module'];
    desc = widget.title['description'];
    url = widget.title['url'].toString();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
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
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.amber.shade600,
                    border: Border.all(width: 1.0),
                    borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.all(15),
                alignment: Alignment.topCenter,
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.amber.shade300,
                padding: EdgeInsets.all(15),
                child: Text(
                  '$module',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 250,
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
                color: Colors.white,
                child: Text(
                  '$desc',
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  maxLines: 10,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )),
      floatingActionButton: Container(
        height: 50,
        width: 200,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 245, 200, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.open_in_browser_rounded,
                color: Colors.black87,
              ),
              Text(
                'Go to URL',
                style: TextStyle(color: Colors.black87, fontSize: 18),
              ),
              SizedBox(width: 15),
            ],
          ),
          onPressed: () => _handleURLButtonPress(url),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _handleURLButtonPress(String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }
}
