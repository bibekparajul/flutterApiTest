import 'package:apipractice/screens/home_screen.dart';
import 'package:apipractice/screens/main_screen.dart';
import 'package:apipractice/screens/photos_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      title: "Api",
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
