import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtr_effects/authentication/auth_controller.dart';
import 'package:vtr_effects/authentication/login_screen.dart';
import 'package:vtr_effects/global.dart';
import 'package:vtr_effects/widgets/input_text_widget.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  var authController = AuthController.instanceAuth;

  @override
  void initState() {
    super.initState();
    showProgressBar = false;
  }

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
            Text("Criar Conta",
                style: GoogleFonts.acme(
                    fontSize: 34,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
            ),

            GestureDetector(
              onTap: () {
                // deixa o usuario escolher a foto de perfil
                //authController.chooseImageFromGallery();
                authController.captureImageFromGallery();
              },
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("images/avatar.png"),
                backgroundColor: Colors.black,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text("Toque para escolher uma foto de perfil.",
                style: GoogleFonts.averiaLibre(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: InputTextWidget(
                textEditingController: userNameTextEditingController,
                lableString: "Nome de usuário",
                iconData: Icons.person_2_outlined,
                isObscure: false,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: InputTextWidget(
                textEditingController: emailTextEditingController,
                lableString: "Email",
                iconData: Icons.email_outlined,
                isObscure: false,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: InputTextWidget(
                textEditingController: passwordTextEditingController,
                lableString: "Senha",
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //login button
            //not have an account
            showProgressBar == false
                ? Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width - 38,
                          height: 54,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: InkWell(
                            onTap: () {
                              if (userNameTextEditingController
                                      .text.isNotEmpty &&
                                  emailTextEditingController.text.isNotEmpty &&
                                  passwordTextEditingController
                                      .text.isNotEmpty) {
                                setState(() {
                                  showProgressBar = true;
                                });
                                authController.createAccountForNewUser(
                                    authController.profileImage,
                                    userNameTextEditingController.text,
                                    emailTextEditingController.text,
                                    passwordTextEditingController.text);
                              }
                            },
                            child: const Center(
                              child: Text("Criar conta",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700)),
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Já tem uma conta? ",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const LoginScreen());
                            },
                            child: const Text("Entrar",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      )
                    ],
                  )
                : const SimpleCircularProgressBar(
                    progressColors: [
                      Colors.yellowAccent,
                    ],
                    animationDuration: 3,
                    backColor: Colors.white38,
                  )
          ],
        ),
      ),
    ));
  }
}
