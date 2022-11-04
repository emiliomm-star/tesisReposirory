// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:ultimateproject/router/router.dart';
import 'package:ultimateproject/ui/views/gestioanr_chofer.dart';
import 'package:ultimateproject/ui/views/map_page.dart';

import '../shared/sidebar.dart';

class DashboardView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return  MapPage();/*Scaffold(
      // ignore: prefer_const_constructors
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('b606ffbd63bafcf68da9b64b97c781b6.jpeg',),fit: BoxFit.cover)
            ),
          ),
          Center(
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(onPressed: (){
                      Navigator.pushNamed(context, Flurorouter.gestionarChofer);
                    
                    }, 
                    icon: Icon(Icons.person), 
                    label: Text('Gestionar-chofer')
                    ),
                    SizedBox(width: 50,),
                    ElevatedButton.icon(onPressed: (){
                      Navigator.pushNamed(context, Flurorouter.gestionarTarea);

                    }, icon: Icon(Icons.work_history), label: Text('Gestionar-tarea')),
                    SizedBox(width: 50,),
                    ElevatedButton.icon(onPressed: (){
                      Navigator.pushNamed(context, Flurorouter.gestionarVehiculo);

                    }, icon: Icon(Icons.drive_eta_rounded), label: Text('Gestionar-vehiculo')),
                    SizedBox(width: 50,)

                  ],
                ),
                SizedBox(height: 60,),
                Container(
                  width: 300,
                  child: ElevatedButton.icon(onPressed: (){
                    Navigator.pushNamed(context, Flurorouter.report);
                  }, icon: Icon(Icons.report), label: Text('Reporte'))),

              ],
            ),
          )
        ],
      ),
    );*/
  }
}