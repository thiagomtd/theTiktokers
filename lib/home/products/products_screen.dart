import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vtr_effects/home/product/product_screen.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatefulWidget {
  final bool parametro;
  const ProductsScreen({required this.parametro});

  @override
  State<ProductsScreen> createState() =>
      _ProductsScreenState(parametro2: parametro);
}

class _ProductsScreenState extends State<ProductsScreen> {
  final bool parametro2;
  _ProductsScreenState({required this.parametro2});

  TextEditingController productIdController = TextEditingController();

  List<String> itemsUser = [];
  List<Map<String, dynamic>> itemList = [];
  List<Map<String, dynamic>> itemList2 = [];

  void BuscarItemsDoUser() async {
    itemsUser.clear();
    if (parametro2) {
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

  void BuscarItems() async {
    itemList.clear();

    var produtcsDocumentSnapshot =
        await FirebaseFirestore.instance.collection("produtos").get();
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
        } else if (!itemsUser.contains(a['name']) &&
            itemsUser.contains(b['name'])) {
          return 1;
        } else {
          return a['name'].compareTo(b['name']);
        }
      });
    });
  }

  Future<bool> VerifyProductId(String productId, String prefixId) async {
    if (!(productId.startsWith(prefixId, 0))) {
      return true;
    }

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      if (documentSnapshot.exists) {
        var userDados = (documentSnapshot.data() as Map<String, dynamic>);
        var list = (userDados['produtos'] as List<dynamic>);
        if (list.any((element) =>
            (element as Map<String, dynamic>)['id'] == productId)) {
          return true;
        }
      }
    }
    return false;
  }

  void AddNewProduct(
      String productId, Map<String, dynamic> ProductSelected) async {
    bool v = await VerifyProductId(productId, ProductSelected['id']);
    if (v) {
      Get.snackbar(
        "",
        "",
        titleText: const Text("Falha",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        messageText: const Text("Produto inválido ou já registrado!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
      );
      return;
    }
    DocumentSnapshot userDocumentSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    var item = <String, dynamic>{};
    item['id'] = productId;
    item['name'] = ProductSelected['name'];
    userDocumentSnapshot.reference.update({
      'produtos': FieldValue.arrayUnion([item])
    });
    BuscarItemsDoUser();
    Get.snackbar("Parabens", "Novo produto registrado!",
        duration: const Duration(seconds: 5));
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
        body: Column(children: [
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
                    if (itemsUser.contains(item['name'])) {
                      var obj = itemList2
                          .where((element) => element['name'] == item['name'])
                          .toList()
                          .first;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(parametro: item, p2: obj)),
                      );
                    } else {
                      openDialog(item);
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
                                backgroundImage:
                                    NetworkImage(item['img'].toString()),
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                item['name'],
                                style: const TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(width: 16.0),
                            ],
                          ),
                          if (itemsUser.contains(item['name']))
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
        ]));
  }

  Future openDialog(Map<String, dynamic> ProductSelected) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Digite o serial do produto'),
          content: TextField(
            controller: productIdController,
            decoration:
                const InputDecoration(hintText: 'Digite o serial do produto'),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(productIdController.text);
                  productIdController.clear();
                },
                child: const Text('Cancelar')),
            TextButton(
                onPressed: () {
                  AddNewProduct(productIdController.text, ProductSelected);
                  Navigator.of(context).pop(productIdController.text);
                  productIdController.clear();
                },
                child: const Text('Enviar')),
          ],
        ),
      );
}
