// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class SplashLayout extends StatefulWidget {

  @override
  State<SplashLayout> createState() => _SplashLayoutState();
}

class _SplashLayoutState extends State<SplashLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: prefer_const_constructors
          CircularProgressIndicator(),
          // ignore: prefer_const_constructors
          SizedBox(height: 20,),
          Text('Cheching')
        ],
      ),),
    );
  }
}