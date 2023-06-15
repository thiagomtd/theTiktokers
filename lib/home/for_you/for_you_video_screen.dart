import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/circular_image_animation.dart';
import '../../widgets/custom_video_player.dart';
import '../comments/comments_screen.dart';
import 'controller_for_you_videos.dart';

class ForYouVideosScreen extends StatefulWidget {
  const ForYouVideosScreen({super.key});

  @override
  State<ForYouVideosScreen> createState() => _ForYouVideosScreenState();
}

class _ForYouVideosScreenState extends State<ForYouVideosScreen> {
  Future openDialog(String msg) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Configuração do pedal'),
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar')),
        ],
      ),
    );
  }

  final ControllerForYouVideos controllerVideosForYou =
      Get.put(ControllerForYouVideos());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          itemCount: controllerVideosForYou.forYouAllVideosList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final eachVideoInfo =
                controllerVideosForYou.forYouAllVideosList[index];

            return Stack(
              children: [
                //video
                CustomVideoPlayer(
                  videoFileUrl: eachVideoInfo.videoUrl.toString(),
                ),

                //left right - panels
                Column(
                  children: [
                    const SizedBox(
                      height: 110,
                    ),

                    //left right - panels
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //left panel
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 18),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //username
                                  Text(
                                    "@" + eachVideoInfo.userName.toString(),
                                    style: GoogleFonts.abel(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 6,
                                  ),

                                  //description - tags
                                  Text(
                                    eachVideoInfo.descriptionTags.toString(),
                                    style: GoogleFonts.abel(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 6,
                                  ),

                                  //artist - song name
                                  Row(
                                    children: [
                                      Image.asset(
                                        "images/music_note.png",
                                        width: 20,
                                        color: Colors.white,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "  " +
                                              eachVideoInfo.artistSongName
                                                  .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.alexBrush(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //right panel
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //profile
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: SizedBox(
                                    width: 62,
                                    height: 62,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 4,
                                          child: Container(
                                            width: 52,
                                            height: 52,
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: Image(
                                                image: NetworkImage(
                                                  eachVideoInfo.userProfileImage
                                                      .toString(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //like button - total Likes
                                Column(
                                  children: [
                                    //like button
                                    IconButton(
                                      onPressed: () {
                                        controllerVideosForYou
                                            .likeOrUnlikeVideo(eachVideoInfo
                                                .videoID
                                                .toString());
                                      },
                                      icon: Icon(
                                        Icons.favorite_rounded,
                                        size: 40,
                                        color: eachVideoInfo.likesList!
                                                .contains(FirebaseAuth
                                                    .instance.currentUser!.uid)
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),

                                    //total Likes
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        eachVideoInfo.likesList!.length
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //comment button - total comments
                                Column(
                                  children: [
                                    //comment button
                                    IconButton(
                                      onPressed: () {
                                        Get.to(CommentsScreen(
                                          videoID:
                                              eachVideoInfo.videoID.toString(),
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.add_comment,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),

                                    //total comments
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        eachVideoInfo.totalComments.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //share button - total shares
                                Column(
                                  children: [
                                    //share button
                                    IconButton(
                                      onPressed: () {
                                        openDialog(
                                            eachVideoInfo.config.toString());
                                      },
                                      icon: const Icon(
                                        Icons.music_note_sharp,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),

                                    //total shares
                                  ],
                                ),

                                //profile circular animation
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CircularImageAnimation(
                                    widgetAnimation: SizedBox(
                                      width: 62,
                                      height: 62,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            height: 52,
                                            width: 52,
                                            decoration: BoxDecoration(
                                              gradient:
                                                  const LinearGradient(colors: [
                                                Colors.grey,
                                                Colors.white,
                                              ]),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: Image(
                                                image: NetworkImage(
                                                  eachVideoInfo.userProfileImage
                                                      .toString(),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }),
    );
    ;
  }
}
