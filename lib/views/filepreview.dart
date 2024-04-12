import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPreviewPage extends StatelessWidget {
  final List<File> pdfFiles;
  final int initialIndex;

  PdfPreviewPage({Key? key, required this.pdfFiles, this.initialIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final File pdfFile = pdfFiles[initialIndex];

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SfPdfViewer.file(pdfFile),
      ),
    );
  }
}
