import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_guide/core/app_widget.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const AppWidget());
}
