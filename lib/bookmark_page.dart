import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key, required this.bookmarkItems}) : super(key: key);
  final List<String> bookmarkItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(backgroundColor: Colors.transparent),
          //title: const Text('BOOKMARK', style: TextStyle(color: Colors.black,),), centerTitle: true,),
        backgroundColor: const Color.fromARGB(255, 42, 147, 142),

        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'NO BOOKMARK CONTENT', textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.56),
                  ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
