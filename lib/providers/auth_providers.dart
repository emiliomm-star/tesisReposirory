

// ignore_for_file: unnecessary_this, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

import '../router/router.dart';
import '../services/local_storage.dart';
import '../services/navigation-services.dart';


enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}


class AuthProvider extends ChangeNotifier {
  
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider(){
    this.isAuthenticated();
  }

  login(String name, String password){


    //peticion http
    this._token = 'qqweqwfasdfasdasf.asdafsadad231.dxfasdrasd';
    LocalStorage.prefs.setString('token', this._token!);
    
    

    print('Almacenar JWT : $_token');

        authStatus =AuthStatus.authenticated;
        notifyListeners();

        if (name != 'admin') {
       //ruta chofer page
       NavigationServices.replaceTo(Flurorouter.choferPagee, {
            'Nombre_chofer' : name
          });

        } else {
          NavigationServices.replaceTo(Flurorouter.dashboardRoute,{});
        }
  }

    Future<bool> isAuthenticated()async{
      if (LocalStorage.prefs.getString('token') == null) {
        authStatus =AuthStatus.notAuthenticated;
        notifyListeners();
        return false;
      }
      //Ir al backend y comprobar si es valido el token 

      Future.delayed(Duration(milliseconds: 1000));
        authStatus =AuthStatus.authenticated;
      notifyListeners();
      return true;
    }
  }


