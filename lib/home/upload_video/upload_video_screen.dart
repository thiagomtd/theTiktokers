import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vtr_effects/home/home_screen.dart';
import 'package:vtr_effects/home/profile/profile_screen.dart';
import 'package:vtr_effects/home/upload_video/upload_form.dart';
import 'dart:io';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  getVideoFile(ImageSource sourceImg) async {
    final videoFile = await ImagePicker().pickVideo(source: sourceImg);

    if (videoFile != null) {
      Get.to(
        UploadForm(
          videoFile: File(videoFile.path),
          videoPath: videoFile.path,
        ),
      );
    }
  }

  displayDialogBox() {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    getVideoFile(ImageSource.gallery);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.image,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Video da Galeria",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    getVideoFile(ImageSource.camera);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.camera_alt_outlined,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Fazer um video com a camera",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Get.back();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.cancel,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Cancelar",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/upload_image.png",
            width: 260,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              displayDialogBox();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              "Enviar Video",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }
}
