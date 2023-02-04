import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:librario/models/books.dart';

class DatabaseService {
  // FirebaseFirestore? _instance;

  // List<Books> _books = [];

  // List<Books> getBooks() {
  //   return _books;
  // }

  // DatabaseService({required this.uid});

  final CollectionReference listBooks =
      FirebaseFirestore.instance.collection('books_data');

  Future<void> createBooksData(
      String tytul, String autor, int pdfUrl, String imgUrl) async {
    return await listBooks.doc(autor).set(
        {'tytul': tytul, 'autor': autor, 'pdfUrl': pdfUrl, 'imgUrl': imgUrl});
  }

  // Future updateBooksList(
  //     String tytul, String autor, int pdfUrl, String uid) async {
  //   return await listBooks
  //       .doc(uid)
  //       .update({'Tytuł': tytul, 'Autor': autor, 'URL': pdfUrl});
  // }

  Future getBooksList() async {
    List itemsList = [];

    try {
      await listBooks.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// get books stream
  Stream<List<Book>> get books_data {
    return listBooks.snapshots().map(_booksListFromSnapshot);
  }

// Book list form snapshot
  List<Book> _booksListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data);
      return Book(
          tytul: doc['tytul'] ?? 0,
          autor: doc['autor'] ?? 0,
          pdfUrl: doc['pdfUrl'] ?? '0',
          imgUrl: doc['imgUrl'] ?? '0');
    }).toList();
  }

  // Future deleteBook() async {
  //   FirebaseFirestore.instance
  //       .collection('books_data')
  //       .where('tytul', isEqualTo: tytul)
  //       .get()
  //       .then((value) {
  //     value.docs.forEach((element) {
  //       FirebaseFirestore.instance
  //           .collection("eventDetails")
  //           .doc(element.id)
  //           .delete()
  //           .then((value) {
  //         print("Success!");
  //       });
  //     });
  //   });
  // }
}
