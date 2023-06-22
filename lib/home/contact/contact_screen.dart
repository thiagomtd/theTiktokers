import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController msg = TextEditingController();
  TextEditingController assunto = TextEditingController();

  void abrirGmail() {
    launch('mailto:bernardo@ucl.br?subject=${assunto.text}&body=${msg.text}');
  }

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
              Center(
                  child: Column(
                children: [
                  const Text("Contato",
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: assunto,
                        maxLines: 1, // Permite várias linhas
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          labelText: 'Assunto',
                          border: OutlineInputBorder(),
                        ),
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: msg,
                        maxLines: 20, // Permite várias linhas
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          labelText: 'Mensagem',
                          border: OutlineInputBorder(),
                        ),
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      height: 54,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: InkWell(
                        onTap: () {
                          if (assunto.text.isEmpty || msg.text.isEmpty) {
                            Get.snackbar(
                              "",
                              "",
                              titleText: const Text("Falha",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              messageText: const Text(
                                  "Preencha todos os campos",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal)),
                              duration: const Duration(seconds: 5),
                              backgroundColor: Colors.red,
                            );
                            return;
                          }
                          abrirGmail();                          
                        },
                        child: const Center(
                          child: Text("Enviar",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 13, 1, 1),
                                  fontWeight: FontWeight.bold)),
                        ),
                      ))
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
