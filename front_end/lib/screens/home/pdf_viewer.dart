import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
import 'package:pdfx/pdfx.dart';

// class PdfViewer extends StatelessWidget {
//   // open a PDF document from assets file

//   var pdf = rootBundle.load('assets/ocument.pdf');

//   PdfViewer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF Viewer'),
//       ),
//       body: PdfPreview(
//         build: (format) => pdf.buffer.asUint8List().save(),
//       ),
//     );
//   }
// }

// class PdfViewer extends StatelessWidget {
//   // open a PDF document from assets file

//   final pdfController = PdfController(
//     document: PdfDocument.openAsset('assets/sample.pdf'),
//   );
//   PdfViewer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final document = PdfDocument.openAsset('assets/sample.pdf');
//     final page = document.getPage(1);

//     final pageImage = page.render(width: page.width, height: page.height);

//     page.close();
//     return Image(
//       image: MemoryImage(pageImage.bytes),
//     );
//   }
// }
