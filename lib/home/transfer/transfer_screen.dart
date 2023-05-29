import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferScreen extends StatefulWidget {
  
  final Map<String, dynamic> parametro;
  const TransferScreen({required this.parametro});

  @override
  State<TransferScreen> createState() => _TransferScreenState(item: parametro);
}

class _TransferScreenState extends State<TransferScreen> {

  final Map<String, dynamic> item;
  _TransferScreenState({required this.item});

  TextEditingController email = TextEditingController();

  void teste() async {
    
    var doc2 = await FirebaseFirestore.instance
          .collection("users").where('email', isEqualTo: 'teste@ucl.br').get();

    var dd = doc2.docs[0].reference;

    var doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid);
          
    dd.update({
      'produtos':FieldValue.arrayUnion([item])
    });
    doc.update({
      'produtos':FieldValue.arrayRemove([item])
    });
  }

  @override
    void initState() {
      super.initState();
      teste();
    }

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
