import 'package:flutter/material.dart';
import 'package:webtoon/screen/home_screen.dart';
import 'package:webtoon/service/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
