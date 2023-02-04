import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:librario/models/books.dart';
import 'package:provider/provider.dart';
import 'package:librario/services/database.dart';

import 'book_tile.dart';

class catalog extends StatefulWidget {
  @override
  _catalogState createState() => _catalogState();
}

class _catalogState extends State<catalog> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Book>?>.value(
      value: DatabaseService().books_data,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Katalog'),
          backgroundColor: Colors.brown,
        ),
        body: BookList(),
      ),
    );
  }
}

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    final book_data = Provider.of<List<Book>>(context);

    return ListView.builder(
      itemCount: book_data.length,
      itemBuilder: (context, index) {
        return BookTile(book: book_data[index]);
      },
    );
  }
}
