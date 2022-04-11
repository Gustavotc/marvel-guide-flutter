import 'package:flutter/material.dart';

import '../../core/app_images.dart';
import '../../core/app_colors.dart';
import '../login/login_screen.dart';

import 'package:marvel_guide/route/route.dart' as route ;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _showNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.popAndPushNamed(context, route.login);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    _showNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Image(image: AssetImage(AppImages.marvelLogo)),
      ),
    );
  }
}
