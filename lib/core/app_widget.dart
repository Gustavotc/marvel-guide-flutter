import 'package:flutter/material.dart';
import 'package:marvel_guide/view/signup/signup_screen.dart';
import 'package:marvel_guide/view/splash/splash_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MarvelGuide",
      home: SplashScreen(),
    );
  }
}
