import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtr_effects/home/following/followings_videos_screen.dart';
import 'package:vtr_effects/home/for_you/for_you_video_screen.dart';
import 'package:vtr_effects/home/home.dart';
import 'package:vtr_effects/home/profile/profile_screen.dart';
import 'package:vtr_effects/home/search/search_screen.dart';
import 'package:vtr_effects/home/upload_video/upload_custom_icon.dart';
import 'package:vtr_effects/home/upload_video/upload_video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List screensList = [ForYouVideosScreen(), UploadVideoScreen(), () => {}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 2) {
            Get.offAll(Home());
          } else {
            setState(() {
              screenIndex = index;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection_sharp,
                size: 30,
              ),
              label: "Videos"),
          BottomNavigationBarItem(icon: UploadCustomIcon(), label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "Home"),
        ],
      ),
      body: screensList[screenIndex],
    );
  }
}
