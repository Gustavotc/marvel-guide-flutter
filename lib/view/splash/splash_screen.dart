import 'package:flutter/material.dart';
import 'package:marvel_guide/repository/splash_repository.dart';

import '../../controller/splash_controller.dart';
import '../../core/app_images.dart';
import '../../core/app_colors.dart';
import '../login/login_screen.dart';

import 'package:marvel_guide/route/route.dart' as route;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashController controller;

  _showNextScreen() async {
    if (await controller.checkLogin()) {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.popAndPushNamed(context, route.about);
    } else {
      Navigator.popAndPushNamed(context, route.login);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = SplashController(repository: SplashRepository());
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
