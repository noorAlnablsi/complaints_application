import 'package:complaints_application/page/Auth/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
String baseUrl = "http://127.0.0.1:8000";