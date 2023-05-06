import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
                child: Text("Sobre",
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
