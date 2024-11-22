import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({super.key});

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (<TargetPlatform>[
      TargetPlatform.windows,
      TargetPlatform.linux,
      TargetPlatform.macOS
    ].contains(platform)) {
      // Pdf view with re-render pdf texture on zoom (not loose quality on zoom)
      // Not supported on windows
      // Also not usable without pinch
      final pdfController = PdfController(
        document: PdfDocument.openAsset('assets/PNC 2023 Annual Report.pdf'),
      );
      return PdfView(
        controller: pdfController,
      );
    } else {
      final pdfController = PdfControllerPinch(
        document: PdfDocument.openAsset('assets/PNC 2023 Annual Report.pdf'),
      );
      return PdfViewPinch(
        controller: pdfController,
      );
    }
  }
}
