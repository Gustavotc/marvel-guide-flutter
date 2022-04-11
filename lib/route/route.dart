import 'package:flutter/material.dart';
import 'package:marvel_guide/view/about/about_screen.dart';
import 'package:marvel_guide/view/home/home_screen.dart';
import 'package:marvel_guide/view/login/login_screen.dart';
import 'package:marvel_guide/view/signup/signup_screen.dart';
import 'package:marvel_guide/view/splash/splash_screen.dart';

const String splash = 'SplashScreen';
const String login = 'LoginScreen';
const String signup = 'SignupScreen';
const String about = 'AboutScreen';
const String home = 'HomeScreen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splash: 
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case login: 
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case signup: 
      return MaterialPageRoute(builder: (context) => const SignupScreen());
    case home: 
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case about: 
      return MaterialPageRoute(builder: (context) => const AboutScreen());
    default: throw('Rota inexistente');
  }

}