import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String tytul;
  final String autor;
  final String pdfUrl;
  final String imgUrl;

  Book(
      {required this.tytul,
      required this.autor,
      required this.pdfUrl,
      required this.imgUrl});
}
