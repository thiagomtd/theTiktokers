import 'package:flutter/material.dart';

class ProductManualScreen extends StatefulWidget {
  const ProductManualScreen({super.key});

  @override
  State<ProductManualScreen> createState() => _ProductManualScreenState();
}

class _ProductManualScreenState extends State<ProductManualScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Product Manual Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
