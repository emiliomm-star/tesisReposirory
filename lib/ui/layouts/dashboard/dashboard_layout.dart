import 'package:flutter/material.dart';
import 'package:ultimateproject/ui/views/dashboard_view.dart';
import 'package:ultimateproject/ui/views/chofer/gestioanr_chofer.dart';
import 'package:ultimateproject/ui/views/tarea/gestionar_tarea_page.dart';
import 'package:ultimateproject/ui/views/vehiculo/gestionar_vehiculo.dart';

import '../../shared/sidebar.dart';


class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Color( 0xffEDF1F2),
      body: Row(
        children: [
          //TODO esto si es mas  de 700px
          

         Expanded(
            child: child,
            )

        ],
      ),
    );
  }
  
 Widget mostrarView( int number) {
    switch (number) {
      case 1:
        return GestionarChofer();
        
      case 2:
        return GestionarTarea();

      case 3:
        return GestionarVehiculo();
        
    
        
      default:
      return DashboardView();
    }
  }
}