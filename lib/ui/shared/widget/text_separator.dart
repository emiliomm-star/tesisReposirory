import 'package:flutter/material.dart';
class TextSeparator extends StatelessWidget {
  final String text;

  const TextSeparator({super.key, required this.text});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(color: Colors.greenAccent),
        ),
    );
  }
}