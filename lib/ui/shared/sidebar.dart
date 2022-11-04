// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ultimateproject/router/router.dart';
import 'package:ultimateproject/services/navigation-services.dart';
import 'package:ultimateproject/ui/shared/widget/logo.dart';
import 'package:ultimateproject/ui/shared/widget/menu_item.dart';
import 'package:ultimateproject/ui/shared/widget/text_separator.dart';

class Sidebar extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: double.infinity,
      decoration: buildDecortaion(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          
          Logo(),

          SizedBox(height: 50,),

          TextSeparator(text: 'Main'),

      

          MenuItems(
            text: 'Gestionar-chofer', 
            icon: Icons.compass_calibration_outlined, 
            onPressed: () => NavigationServices.replaceTo(Flurorouter.gestionarChofer,{})
            ),
          MenuItems(
            text: 'Gestionar-tarea', 
            icon: Icons.compass_calibration_outlined, 
            onPressed: () => print('Dashboard')
            ),
          MenuItems(
            text: 'Gestionar-vehiculo', 
            icon: Icons.compass_calibration_outlined, 
            onPressed: () => print('Dashboard')
            ),
          MenuItems(
            text: 'Reportes', 
            icon: Icons.compass_calibration_outlined, 
            onPressed: () => print('Dashboard')
            ),
         
        ],
      ),
    );
  }

  // ignore: prefer_const_constructors
  BoxDecoration buildDecortaion() => BoxDecoration(
    // ignore: prefer_const_constructors
    gradient: LinearGradient(colors: [
      Color(0xff092044),
      Color(0xff092043),
      
    ],
    
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ]
  );
}