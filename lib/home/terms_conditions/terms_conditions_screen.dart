import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  final String termos;
  const TermsAndConditionsScreen({required this.termos});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState(termos_: this.termos);
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  final String termos_;
  _TermsAndConditionsScreenState({required this.termos_});
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
          child: Text("Termos",
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
          child: Text(termos_,
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
