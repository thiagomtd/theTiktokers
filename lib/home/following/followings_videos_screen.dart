import 'package:flutter/material.dart';

class FollowingsVideosScreen extends StatefulWidget {
  const FollowingsVideosScreen({super.key});

  @override
  State<FollowingsVideosScreen> createState() => _FollowingsVideosScreenState();
}

class _FollowingsVideosScreenState extends State<FollowingsVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Followings Videos Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
