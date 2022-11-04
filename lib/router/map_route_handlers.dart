



import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/ui/views/map_page.dart';

import '../providers/auth_providers.dart';
import '../ui/views/login_view.dart';

class MapPageHandlers {
  static Handler map= Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return MapPage();
        
      }else{
        return LoginView();
      }
    }
  );

}