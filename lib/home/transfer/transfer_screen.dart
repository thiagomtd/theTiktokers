import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {

TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            "images/vtr_logo.png",
            width: 300,
          ),  
          const Center(
            child: Text("Transferência",
                style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: email,
              maxLines: 1, // Permite várias linhas
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            )
          ),
          const SizedBox(
            height: 50,
          ),
          Container(width: MediaQuery.of(context).size.width /2 - 10,
            height: 54,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(10))),
            child: InkWell( 
              onTap: ()  {
                  
              },
              child: const Center(
                child: Text("Transferir",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)),
              ),
            )
          )
        ]
      ),
    );
  }
}
