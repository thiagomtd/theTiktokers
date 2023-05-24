import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

import '../product_manual/product_manual_screen.dart';
import '../terms_conditions/terms_conditions_screen.dart';
import '../transfer/transfer_screen.dart';


class ProductScreen extends StatefulWidget {
  final Map<String, dynamic> parametro;
  const ProductScreen({required this.parametro});
  

  @override
  State<ProductScreen> createState() => _ProductScreenState(item:this.parametro);
}

class _ProductScreenState extends State<ProductScreen> {

  final Map<String, dynamic> item;
  _ProductScreenState({required this.item});

  //  @override
  //   void initState() {
  //     super.initState();
  //   }
  
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
              Center(
                child: Text(item["name"],
                    style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(
                height: 25,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(item['img'].toString()),
              ),
              const SizedBox(
                height: 25,
              ),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 54,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                    child: InkWell(                      
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductManualScreen()),
                        );        
                      },
                      child: const Center(
                        child: Text("Manual",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                      ),
                    )
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 54,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                    child: InkWell(                      
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                        );                  
                      },
                      child: const Center(
                        child: Text("Termos",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                      ),
                    )
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 54,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TransferScreen()),
                        );                  
                      },
                      child: const Center(
                        child: Text("Transferência",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                      ),
                    )
                  )
                ],
              ),
                
             
            ]
          )      
    );
  }
}
