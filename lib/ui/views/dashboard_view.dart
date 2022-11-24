// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:ready/ready.dart';
import 'package:ultimateproject/router/router.dart';
import 'package:ultimateproject/ui/views/chofer/gestioanr_chofer.dart';
import 'package:ultimateproject/ui/views/tarea/gestionar_tarea_page.dart';
import 'package:ultimateproject/ui/views/vehiculo/gestionar_vehiculo.dart';
import 'package:ultimateproject/ui/views/map_page.dart';
import 'package:ultimateproject/ui/views/reporte/reportList.dart';

import '../../models/hiveModels/hive_chofer_model.dart';
import '../../models/hiveModels/hive_reporte_model.dart';
import '../shared/sidebar.dart';

class DashboardView extends StatefulWidget {
  

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  final TextEditingController buscar_controller  = TextEditingController();
  List<ReporteModel> listReportes = [];
  List<Chofer> listaChoferes = [];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return  Scaffold(
      // ignore: prefer_const_constructors
      body: ReadyDashboard(
        drawerOptions: (desktop) {
         return DrawerOptions(
            backgroundColor: Color.fromARGB(255, 70, 184, 241)
          );
        },
        appBarOptions: (desktop) {
          return AppBarOptions(
            theme: AppBarTheme(
              color: Color.fromARGB(255, 129, 204, 242)
            )
          );
        },
        
        items: [
       DashboardItem(
        actions: [
         IconButton(onPressed: (() {
        Navigator.pushNamed(context, Flurorouter.choferListRoute);

         }), 
         icon: Icon(Icons.list)
         )
        ],
  builder: () {
    return GestionarChofer();
  },
  icon: const Icon(Icons.person),
  id: 'Gchofer_id',
  label: 'Gestionar chofer',
  
),
       DashboardItem(
         actions: [
         IconButton(onPressed: (() {
        Navigator.pushNamed(context, Flurorouter.tareasListRoute);

         }), icon: Icon(Icons.list))
        ],
       
  builder: () {
    return GestionarTarea();
  },
  icon: const Icon(Icons.play_for_work),
  id: 'Gtarea_id',
  label: 'Gestionar tarea',
),
       DashboardItem(
        actions: [
            IconButton(onPressed: (() {
        Navigator.pushNamed(context, Flurorouter.vehiculosListRoute);

         }), icon: Icon(Icons.list))
        ],
        
  builder: () {
    return GestionarVehiculo();
  },
  icon: const Icon(Icons.airport_shuttle),
  id: 'Gvehiculo_id',
  label: 'Gestionar vehiculo',
),
       DashboardItem(
  
  label: 'Mostrar Reportes', 
  id: 'Greporte_id', 
  builder: (){
    return ReportView();
  }, 
  icon: Icon(Icons.report)
  )
   
        
        
          
      ]),
      /*Stack(
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
      ),*/
    );
  }
}