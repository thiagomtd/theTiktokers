import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:vtr_effects/global.dart';
import 'package:vtr_effects/home/upload_video/upload_controller.dart';
import 'package:vtr_effects/widgets/input_text_widget.dart';

class UploadForm extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  UploadForm({
    required this.videoFile,
    required this.videoPath,
  });

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  UploadController uploadVideoController = Get.put(UploadController());
  VideoPlayerController? playerController;
  TextEditingController artistSongTextEditingController =
      TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();
  TextEditingController configTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {
      playerController = VideoPlayerController.file(widget.videoFile);
    });

    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(2);
    playerController!.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    playerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              child: VideoPlayer(
                playerController!,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            showProgressBar == true
                ? const Center(child: CircularProgressIndicator(color: Colors.yellow,))
                : Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: InputTextWidget(
                          textEditingController:
                              artistSongTextEditingController,
                          lableString: "Artista da musica",
                          iconData: Icons.music_video_sharp,
                          isObscure: false,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: InputTextWidget(
                          textEditingController: configTextEditingController,
                          lableString: "Config",
                          iconData: Icons.music_video_sharp,
                          isObscure: false,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: InputTextWidget(
                          textEditingController:
                              descriptionTextEditingController,
                          lableString: "Descrição",
                          iconData: Icons.slideshow_sharp,
                          isObscure: false,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 38,
                        height: 54,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (configTextEditingController.text.isNotEmpty &&
                                artistSongTextEditingController
                                    .text.isNotEmpty &&
                                descriptionTextEditingController
                                    .text.isNotEmpty) {
                              uploadVideoController
                                  .saveVideoInformationToFirestoreDatabase(
                                configTextEditingController.text,
                                descriptionTextEditingController.text,
                                artistSongTextEditingController.text,
                                widget.videoPath,
                                context,
                              );
                              setState(() {
                                showProgressBar = true;
                              });
                            } else {
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
                            }
                          },
                          child: const Center(
                            child: Text(
                              "Enviar",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
