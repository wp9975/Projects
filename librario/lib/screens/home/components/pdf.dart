import 'package:flutter/material.dart';
import 'package:librario/screens/home/components/katalog.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'book_tile.dart';

/// Represents Homepage for Navigation
class Pdf extends StatefulWidget {
  @override
  _PdfState createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  static var pdfUrl =
      'https://wolnelektury.pl/media/book/pdf/boska-komedia.pdf';

  bool x = true;
  @override
  void initState() {
    super.initState();
    if (BookTile.pdfPath.length > 20) {
      print('Otwarcie ścieżki z katalogu');
      setState(() {
        pdfUrl = BookTile.pdfPath;
      });
    } else {
      AlertDialog(
        title: const Text('Alert'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Wybierz książkę z listy!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Katalog'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookList()),
              );
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: Colors.brown,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        pdfUrl,
        key: _pdfViewerKey,
      ),
    );
  }
}
