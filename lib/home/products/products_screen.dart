import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vtr_effects/home/product/product_screen.dart';


class ProductsScreen extends StatefulWidget {
  final bool parametro;
  const ProductsScreen({required this.parametro});
  

  @override
  State<ProductsScreen> createState() => _ProductsScreenState(parametro2:parametro);
}

class _ProductsScreenState extends State<ProductsScreen> {

  final bool parametro2;
  _ProductsScreenState({required this.parametro2});
  List<String> itemsUser = [];  
  List<Map<String, dynamic>> itemList = [];
  List<Map<String, dynamic>> itemList2 = [];

  void BuscarItemsDoUser() async{
    itemsUser.clear();
    if(parametro2){
      DocumentSnapshot userDocumentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      var userDados = (userDocumentSnapshot.data() as Map<String, dynamic>);
      for (var element in userDados['produtos']) {
        var j = (element as Map<String, dynamic>)['name'];
        setState(() {
          itemList2.add(element);
          itemsUser.add(j.toString());
        });
      }
    }

    BuscarItems();
  }
  void BuscarItems() async{

    itemList.clear();

    var produtcsDocumentSnapshot = await FirebaseFirestore.instance
          .collection("produtos").get();
    for (var element in produtcsDocumentSnapshot.docs) {
      
      var item = element.data();
      setState(() {
        itemList.add(item);
      });
    }
    setState(() {
      itemList.sort((a, b) {
        if (itemsUser.contains(a['name']) && !itemsUser.contains(b['name'])) {
          return -1;
        } else if (!itemsUser.contains(a['name']) && itemsUser.contains(b['name'])) {
          return 1;
        } else {
          return a['name'].compareTo(b['name']);
        }
      });
    });
    
  }
   @override
    void initState() {
      super.initState();
      BuscarItemsDoUser();
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
                child: Text("Produtos",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    var item = itemList[index];
                    return GestureDetector(
                      onTap: () {
                        if( itemsUser.contains(item['name'])){
                          var obj = itemList2.where((element) => element['name'] == item['name']).toList().first;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProductScreen(parametro: item, p2:obj)),
                          );
                        }
                        
                      },
                      onLongPress: () {
                        launch(item['link'].toString());
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                          color: const Color.fromARGB(255, 19, 24, 0),
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(item['img'].toString()),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Text(
                                    item['name'],
                                    style: const TextStyle(fontSize: 18.0),
                                  ),                                  
                                  const SizedBox(width: 16.0), 
                                ],
                              ),
                              if(itemsUser.contains(item['name']))
                                Image.asset(
                                  "images/palheta.png",
                                  width: 25,
                                ),    
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]
          )      
    );
  }
}
