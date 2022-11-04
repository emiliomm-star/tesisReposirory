// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/ui/views/listado_page.dart';

import '../providers/auth_providers.dart';
import '../ui/views/login_view.dart';

class choferListHandlers {
  static Handler choferList = Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return ListadoPage();
        
      }else{
        return LoginView();
      }
    }
  );
}
