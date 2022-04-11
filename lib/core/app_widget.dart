import 'package:flutter/material.dart';
import 'package:marvel_guide/core/app_colors.dart';
import 'package:marvel_guide/view/about/about_screen.dart';

import 'app_text.dart';
import '../route/route.dart' as route;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MarvelGuide",
      home: const AboutScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColors.black
        ),
        scaffoldBackgroundColor: AppColors.black,
        textTheme: AppText.generateTextTheme(),
      ),
      onGenerateRoute: route.controller,
      initialRoute: route.splash,
    );
  }
}
