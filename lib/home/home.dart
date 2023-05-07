import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtr_effects/home/about_us/about_us_screen.dart';
import 'package:vtr_effects/home/contact/contact_screen.dart';
import 'package:vtr_effects/home/home_screen.dart';
import 'package:vtr_effects/home/products/products_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MainHomeState();
}

class _MainHomeState extends State<Home> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                "images/vtr_logo.png",
                width: 300,
              ),
              Column(children: [
                const SizedBox(
                          height: 50,
                        ),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(width: MediaQuery.of(context).size.width /2 - 10,
                            height: 54,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProductsScreen()),
                                );
                              },
                              child: const Center(
                                child: Text("Produtos",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                              ),
                            )),
                            Container(width: MediaQuery.of(context).size.width /2 - 10,
                            height: 54,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: InkWell(
                              onTap: () {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()),
                                );
                              },
                              child: const Center(
                                child: Text("Rede VTR",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ))
                ],),
                const SizedBox(
                          height: 15,
                        ),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(width: MediaQuery.of(context).size.width /2 - 10,
                            height: 54,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: InkWell(
                              onTap: () {      
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                                );     
                              },
                              child: const Center(
                                child: Text("Sobre",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                              ),
                            )),
                            Container(width: MediaQuery.of(context).size.width /2 - 10,
                            height: 54,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: InkWell(
                              onTap: () {  
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ContactScreen()),
                                );                              
                              },
                              child: const Center(
                                child: Text("Fale Conosco",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ))
                ],)
              ],)              
            ],
          ),
        ),
      ),
    );
  }
}
