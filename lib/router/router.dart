// ignore_for_file: unnecessary_new

import 'package:fluro/fluro.dart';
import 'package:ultimateproject/router/chofer_list_handler.dart';
import 'package:ultimateproject/router/report_handlers.dart';
import 'package:ultimateproject/router/tareas_list_handlers.dart';
import 'package:ultimateproject/router/update_handlers.dart';
import 'package:ultimateproject/router/vehiculo_list_handlers.dart';


import 'admin_handlers.dart';
import 'choferPage_handlers.dart';
import 'dashboard_handlers.dart';
import 'gchofer_handlers.dart';
import 'gtarea_handlers.dart';
import 'gvehiculo.dart';
import 'map_route_handlers.dart';
import 'no_page_found_handlers.dart';

class Flurorouter {

  static final FluroRouter router = new FluroRouter();

  static String rootRoute     = '/';

  // Auth Router
  static String loginRoute    = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';

   
   //Gestionar chofer
  static String gestionarChofer = '/dashboard/Gchofer';

   //Gestionar tarea
  static String gestionarTarea = '/dashboard/Gtarea';

   //Gestionar vehiculo
  static String gestionarVehiculo = '/dashboard/Gvehiculo';

   //Reporte
  static String report = '/dashboard/lista-reporte';

  //ChoferList
  static String choferListRoute= '/dashboard/choferList';

  //TareasList
  static String tareasListRoute= '/dashboard/tareasList';

  //TareasList
  static String vehiculosListRoute= '/dashboard/vehiculosList';

  //ChoferPage
  static String choferPagee= '/dashboardChofer';
 
  //MapRoute
  static String mapRoute= '/dashboardChofer/mapRoute';

  //UpdatePage
  static String updatePage ='/dashboardChofer/updatePage';


  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none );
  //Dashboard
    router.define(dashboardRoute, handler: DahsboardHandlers.dashborad  );
    //router.define(dashboardRoute, handler: DahsboardHandlers.dashborad  );

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

    //Gestionar chofer
    router.define(gestionarChofer, handler: GchoferHandlers.gchofer, transitionType: TransitionType.none );
    
    //Gestionar tarea
    router.define(gestionarTarea, handler: GtareaHandlers.gtarea, transitionType: TransitionType.none );
    
    //Gestionar vehiculo
    router.define(gestionarVehiculo, handler: GvehiculoHandlers.gvehiculo, transitionType: TransitionType.none );

     // Chofer List
    router.define(choferListRoute, handler: choferListHandlers.choferList, transitionType: TransitionType.none );
    
     // Tarea List
    router.define(tareasListRoute, handler: TareaListHandlers.tareaList, transitionType: TransitionType.none );

     // Vehiculo List
    router.define(vehiculosListRoute, handler: VehiculoListHandlers.vehiculoList, transitionType: TransitionType.none );

    // Report
    router.define(report, handler: ReportHandlers.report, transitionType: TransitionType.none );

    // Chofer Page
    router.define(choferPagee, handler: ChoferPageHandlers.chofer, transitionType: TransitionType.none );

    // Map Page
    router.define(mapRoute, handler: MapPageHandlers.map, transitionType: TransitionType.none );

    // Update Page
    router.define(updatePage, handler: Updatehandlers.udpate, transitionType: TransitionType.none );
  }
  


}

