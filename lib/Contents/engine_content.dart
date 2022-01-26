import 'package:flutter/material.dart';
import 'package:project_test/Contents/content_page2.dart';
import 'package:project_test/Contents/engine_content2.dart';
import 'package:project_test/Models/database_engineering.dart';


class EContentPage extends StatefulWidget {
  const EContentPage({Key? key}) : super(key: key);

  @override
  _EContentPageState createState() => _EContentPageState();
}

class _EContentPageState extends State<EContentPage> {

  List<String> bookmarked = <String>[];

  late EDatabase dBContent;
  List docs = [];
  initialize(){
    dBContent = EDatabase();
    dBContent.initialize();
    dBContent.dBContent().then((value) => {
      setState((){
        docs = value;
      })
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 147, 142),
      appBar: AppBar(title: const Text("ENGINEERING", style: TextStyle(color: Colors.black,),),
        backgroundColor: Color.fromARGB(255, 245, 200, 64),centerTitle: true,
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EContentPage2(title:docs[index],dBContent:dBContent)));
              },
              contentPadding: const EdgeInsets.only(right: 30, left: 36),
              title: Text(docs[index]['title'],
                style: const TextStyle(
                    fontSize: 20
                ),),
              trailing: Icon(
                newTitle ? Icons.bookmark : Icons.bookmark_border,
                color: newTitle ? Colors.black : null,
              ),
              onLongPress: () {
                setState(() {
                  if (newTitle) {
                    bookmarked.remove(word);
                  } else {
                    bookmarked.add(word);
                  }
                  //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BookmarkPage(bookmarkItems: bookmarked,)));
                });
              },
            )
        );
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
