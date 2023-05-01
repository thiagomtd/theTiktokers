import 'package:flutter/material.dart';

class ForYouVideosScreen extends StatefulWidget {
  const ForYouVideosScreen({super.key});

  @override
  State<ForYouVideosScreen> createState() => _ForYouVideosScreenState();
}

class _ForYouVideosScreenState extends State<ForYouVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "ForYou Videos Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
