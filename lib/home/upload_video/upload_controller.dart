import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:vtr_effects/global.dart';
import 'package:vtr_effects/home/home_screen.dart';
import 'package:vtr_effects/home/upload_video/video.dart';

class UploadController extends GetxController {
  compressVideoFile(String videoFilePath) async {
    final compressedVideoFilePath = await VideoCompress.compressVideo(
      videoFilePath,
      quality: VideoQuality.MediumQuality,
    );
    return compressedVideoFilePath!.file;
  }

  uploadCompressedVideoFileToFirebaseStorage(
    String videoID,
    String videoFilePath,
  ) async {
    UploadTask videoUploadTask = FirebaseStorage.instance
        .ref()
        .child("All Videos")
        .child(videoID)
        .putFile(await compressVideoFile(videoFilePath));

    TaskSnapshot snapshot = await videoUploadTask;
    String downloadUrlOfUploadedVideo = await snapshot.ref.getDownloadURL();
    return downloadUrlOfUploadedVideo;
  }

  getThumbnailImage(String videoFilePath) async {
    final thumbnailImage = await VideoCompress.getFileThumbnail(videoFilePath);
    return thumbnailImage;
  }

  uploadThumbnailImageToFirebaseStorage(
    String videoID,
    String videoFilePath,
  ) async {
    UploadTask thumbnailUploadTask = FirebaseStorage.instance
        .ref()
        .child("All Thumbnails")
        .child(videoID)
        .putFile(await getThumbnailImage(videoFilePath));

    TaskSnapshot snapshot = await thumbnailUploadTask;
    String downloadUrlOfUploadedThumbnail = await snapshot.ref.getDownloadURL();
    return downloadUrlOfUploadedThumbnail;
  }

  saveVideoInformationToFirestoreDatabase(
    String artistSongName,
    String descriptionTags,
    String videoFilePath,
    BuildContext context,
  ) async {
    try {
      DocumentSnapshot userDocumentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      String videoID = DateTime.now().microsecondsSinceEpoch.toString();

      String videoDownloadUrl =
          await uploadCompressedVideoFileToFirebaseStorage(
        videoID,
        videoFilePath,
      );

      String thumbnailDownloadUrl =
          await uploadCompressedVideoFileToFirebaseStorage(
        videoID,
        videoFilePath,
      );

      Video videoObject = Video(
        userID: FirebaseAuth.instance.currentUser!.uid,
        userName: (userDocumentSnapshot.data() as Map<String, dynamic>)["name"],
        userProfileImage:
            (userDocumentSnapshot.data() as Map<String, dynamic>)["image"],
        videoID: videoID,
        totalComments: 0,
        totalShares: 0,
        likesList: [0],
        artistSongName: artistSongName,
        descriptionTags: descriptionTags,
        videoUrl: videoDownloadUrl,
        thumbnailUrl: thumbnailDownloadUrl,
        publishedDateTime: DateTime.now().microsecondsSinceEpoch,
      );

      await FirebaseFirestore.instance
          .collection("videos")
          .doc(videoID)
          .set(videoObject.toJson());

      showProgressBar = false;

      Get.to(const HomeScreen());

      Get.snackbar(
        "Novo Video",
        "Compartilhou com sucesso o seu novo video",
      );
    } catch (errorMsg) {
      Get.snackbar(
        "Falha ao enviar o video",
        "Erro durante o envio do video, tente novamente",
      );
    }
  }
}
