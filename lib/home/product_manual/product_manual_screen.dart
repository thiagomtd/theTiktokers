import 'package:flutter/material.dart';

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
        Center(
          child: Text(manual_,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.normal)),
        ),
      ]),
    );
  }
}
