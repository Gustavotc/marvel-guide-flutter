import 'package:flutter/material.dart';
import 'package:marvel_guide/repository/splash_repository.dart';
import 'package:marvel_guide/service/firebase_service.dart';
import 'package:marvel_guide/store/favorites_store.dart';

import '../../controller/splash_controller.dart';
import '../../core/app_images.dart';
import '../../core/app_colors.dart';

import 'package:marvel_guide/route/route.dart' as route;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashController controller;

  _showNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    if (await controller.checkLogin()) {
      FavoritesStore.instance.favorites = await FirebaseService.getFavorites();
      Navigator.popAndPushNamed(context, route.home);
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
