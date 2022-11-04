

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NavigationServices {

  static GlobalKey<NavigatorState>  navigatorkey= GlobalKey<NavigatorState>() ;

  static navigateTo(String routeName){
    return navigatorkey.currentState!.pushNamed(routeName);
  }


  static replaceTo(String routeName, Map<dynamic , dynamic> argumentos){
    return navigatorkey.currentState!.pushReplacementNamed(routeName, arguments: argumentos);
  }
  
}