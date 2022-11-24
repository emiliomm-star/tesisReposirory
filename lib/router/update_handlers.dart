// ignore_for_file: prefer_const_constructors

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/ui/views/chofer/update_page_chofer_view.dart';

import '../providers/auth_providers.dart';
import '../ui/views/login_view.dart';

class Updatehandlers {
  static Handler udpate = Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return UpdateChoferPage();
        
      }else{
        return LoginView();
      }
    }
  );

}
