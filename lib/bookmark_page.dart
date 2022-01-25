import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key, required this.bookmarkItems}) : super(key: key);
  final List<String> bookmarkItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: ListView.separated(
            itemCount: bookmarkItems.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) =>
                ListTile(
                  title: Text(bookmarkItems[index]),
                )

        )
    );
  }
}
