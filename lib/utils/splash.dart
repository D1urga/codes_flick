import 'dart:async';

import 'package:flick_analytics/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 239, 249),
      body: Center(
        child: FlickImageAsset(),
      ),
    );
  }
}

class FlickImageAsset extends StatelessWidget {
  const FlickImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('images/logo_flick_analytics.png');
    Image image = Image(image: assetImage);
    return SizedBox(
      height: 80,
      width: 280,
      child: image,
    );
  }
}
