import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color txtColor;

  const Button({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.txtColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: txtColor),
        ),
      ),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(45)),
    );
  }
}
