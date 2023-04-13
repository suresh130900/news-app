import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/login_page.dart';

import 'home.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: MyThemeApp.appThemeDark(),
      home: login(),

    );
  }
}

