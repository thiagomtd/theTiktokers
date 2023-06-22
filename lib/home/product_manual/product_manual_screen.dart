import 'package:flutter/material.dart';

import 'PDFScreen.dart';

class ProductManualScreen extends StatefulWidget {
  final String manual;
  const ProductManualScreen({required this.manual});
  @override
  State<ProductManualScreen> createState() =>
      _ProductManualScreenState(manual_: this.manual);
}

class _ProductManualScreenState extends State<ProductManualScreen> {
  final String manual_;
  _ProductManualScreenState({required this.manual_});

//   Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PDFScreen(path: pathPDF),
//                         ),
//                       );

//   Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => PdfViewerPage(
//       pdfUrl: 'URL_DO_PDF',
//     ),
//   ),
// );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          "images/vtr_logo.png",
          width: 300,
        ),
        const Center(
          child: Text("Manual",
              style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w700)),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 38,
          
          child: Text(manual_,
          textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.normal)),
        ),
      ]),
    );
  }
}
