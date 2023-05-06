import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "images/vtr_logo.png",
                width: 300,
              ),       
              const Center(
                child: Text("Contato",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700)),
              ),      
            ],
          ),
        ),
      ),
    );
  }
}
