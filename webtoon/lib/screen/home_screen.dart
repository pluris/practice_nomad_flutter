import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text("Today's 툰s",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
