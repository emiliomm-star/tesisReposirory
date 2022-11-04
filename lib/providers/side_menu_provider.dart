

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class SideMenuProvider{
  static late AnimationController menuController;
  static bool isOpen = false;

  static Animation<double> movement = Tween<double>(begin: -200, end: 0).
  animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).
  animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));



  static void OpenMenu(){
    isOpen = true;
    menuController.forward();
  }


  static void closeMenu(){
    isOpen = false;
    menuController.reverse();
  }







}