
// ignore_for_file: use_key_in_widget_constructors, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/models/hiveModels/hive_chofer_model.dart';
import 'package:ultimateproject/models/hiveModels/hive_reporte_model.dart';
import 'package:ultimateproject/models/hiveModels/hive_vehiculo_model.dart';
import 'package:ultimateproject/providers/auth_providers.dart';
import 'package:ultimateproject/router/router.dart';
import 'package:ultimateproject/services/local_storage.dart';
import 'package:ultimateproject/services/navigation-services.dart';
import 'package:ultimateproject/ui/layouts/auth/auth_layout.dart';
import 'package:ultimateproject/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:ultimateproject/ui/layouts/splash/splash_layout.dart';

import 'models/hiveModels/hive_director_model.dart';
 
void main()async{

  await Hive.initFlutter();

  Hive.registerAdapter(ChoferAdapter());
  Hive.registerAdapter(DirectorModelAdapter());
  Hive.registerAdapter(VehiculoModelAdapter());
  Hive.registerAdapter(ReporteModelAdapter());

 await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(AppState());

}

class AppState extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthProvider(),lazy: false,)
    ],child: MyApp(),);
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UCI- Servicio Comunales',
      initialRoute: '/',
      
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationServices.navigatorkey,
      builder: ( _ , child ){
        final authProvider = Provider.of<AuthProvider>(context);
        if (authProvider.authStatus == AuthStatus.checking) 
          return SplashLayout();
        //
        
        if (authProvider.authStatus == AuthStatus.authenticated) {
            return DashboardLayout(child: child!);
        }else{
        }
       // print(LocalStorage.prefs.getString('token'));
       // return DashboardLayout( child: child! );

          return AuthLayout(child: child!);
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5)
          )
        )
      ),
    );
  }
}