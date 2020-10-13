import 'package:flutter/material.dart';
import 'package:hacker_news/pages/home.page.dart';
import 'package:hacker_news/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hacker News',
      theme: hackTheme(),
      home: HomePage(),
    );
  }
}

