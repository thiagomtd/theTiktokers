import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vtr_effects/authentication/login_screen.dart';
import 'package:vtr_effects/global.dart';
import 'user.dart' as userModel;

class AuthController extends GetxController {
  late Rx<File?> _pickedFile;
  File? get profileImage => _pickedFile.value;

  static AuthController instanceAuth = Get.put(AuthController());

  void chooseImageFromGallery() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImageFile != null) {
      Get.snackbar("Imagem de Perfil", "Selecionado a foto com sucesso");
    }

    _pickedFile = Rx<File?>(File(pickedImageFile!.path));
  }

  void captureImageFromGallery() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImageFile != null) {
      Get.snackbar("Imagem de Perfil", "Tirou a foto com sucesso");
    }

    _pickedFile = Rx<File?>(File(pickedImageFile!.path));
  }

  void createAccountForNewUser(File imageFile, String userName,
      String userEmail, String userPassword) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      String imageDownloadUrl = await uploadImageToStorage(imageFile);

      userModel.User user = userModel.User(
        name: userName,
        email: userEmail,
        image: imageDownloadUrl,
        uid: credential.user!.uid,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set(user.toJson());
    } catch (error) {
      Get.snackbar("Falha na criação de conta",
          "Erro ao tentar criar a conta, tente novamente.");
      showProgressBar = false;
      Get.to(() => const LoginScreen());
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = reference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrlOfUploadedImage = await taskSnapshot.ref.getDownloadURL();

    return downloadUrlOfUploadedImage;
  }
}
