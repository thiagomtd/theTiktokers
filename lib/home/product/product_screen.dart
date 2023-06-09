import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../product_manual/PDFScreen.dart';
import '../terms_conditions/terms_conditions_screen.dart';
import '../transfer/transfer_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';


class ProductScreen extends StatefulWidget {
  final Map<String, dynamic> parametro;
  final Map<String, dynamic> p2;
  const ProductScreen({required this.parametro, required this.p2});
  

  @override
  State<ProductScreen> createState() => _ProductScreenState(item:this.parametro, p3:this.p2);
}

class _ProductScreenState extends State<ProductScreen> {

  final Map<String, dynamic> item;
  final Map<String, dynamic> p3;
  _ProductScreenState({required this.item, required this.p3});
  
    String? filePath;
    Future<String> _downloadPDF(String pdfUrl) async {
      print(pdfUrl);
      final dio = Dio();
      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/meu_arquivo.pdf';

      await dio.download(pdfUrl, filePath);
      
      return filePath;
    }
    void teste() async{
      String pdfUrl = await FirebaseStorage.instance.ref(item['manual'].toString()).getDownloadURL();
      
      var filePath2 = await _downloadPDF(pdfUrl);
      setState(() {
        filePath = filePath2;
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
                    decoration:  BoxDecoration(
                        color: filePath == null? Colors.grey:Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: InkWell(                      
                      onTap: () {
                          if(filePath == null){
                            return;
                          }
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PDFScreen(
                              path: filePath,
                            ),
                          ),
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
                          MaterialPageRoute(builder: (context) => TermsAndConditionsScreen(termos:  item['termo'].toString())),
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
                          MaterialPageRoute(builder: (context) => TransferScreen(parametro: p3,)),
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
