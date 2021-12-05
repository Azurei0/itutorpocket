import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text("ITUTORPOCKET"), backgroundColor: Colors.yellow,
      //centerTitle: true,
      //),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 100,
                  child: Image.asset("assets/images/main_logo.png",
                    fit: BoxFit.contain,)
              ),

              const Text("Bookmark", style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold),
              ),

              // const Text("Username", style: TextStyle(
                 // fontSize: 20, fontWeight: FontWeight.w500),),

              // const Text("Email", style: TextStyle(
                 // fontSize: 20, fontWeight: FontWeight.w500),),

            ],
          ),
        ),
      ),
    );
  }
}