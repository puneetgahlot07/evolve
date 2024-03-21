// ignore_for_file: must_be_immutable

import 'package:evolve/common-widgets/custom_appbar_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get_core/src/get_main.dart';

class PdfViewPage extends StatefulWidget {
  String filePath;
   PdfViewPage({super.key, required this.filePath});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  late PDFViewController pdfViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBarOne(
        isAction: false,
        leadingOnTap: () {
          Navigator.pop(context);
        },
      ),
      body:   Center(
        child: PDFView(
        filePath: widget.filePath,
        autoSpacing: true,
        enableSwipe: true,
        pageSnap: true,
        swipeHorizontal: true,
        onError: (error) {
          print(error);
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController vc) {
          pdfViewController = vc;
        },
        onPageChanged: (int? page, int? total) {
          print('page change: $page/$total');
        },
      ),
      )
    );
  }
}