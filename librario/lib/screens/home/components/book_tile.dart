import 'package:flutter/material.dart';
import 'package:librario/models/books.dart';
import 'package:librario/screens/home/home.dart';
import 'pdf.dart';

class BookTile extends StatelessWidget {
  final Book? book;
  BookTile({this.book});
  static String pdfPath = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        color: Colors.brown[50],
        child: ListTile(
          leading: ClipRRect(
              child: Container(
            child: Image.network(
              book!.imgUrl,
              width: 100,
            ),
          )),
          title: Text(book!.tytul),
          subtitle: Text(book!.autor),
          onTap: () {
            pdfPath = book!.pdfUrl;
            print(pdfPath);
          },
        ),
      ),
    );
  }
}
