
import 'package:fluro/fluro.dart';


import 'package:provider/provider.dart';

import '../providers/auth_providers.dart';
import '../ui/views/dashboard_view.dart';
import '../ui/views/login_view.dart';
import '../ui/views/register_view.dart';

class AdminHandlers {

  static Handler login = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LoginView();
        
      }else{
        return DashboardView();
      }
    }
  );

  static Handler register = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return RegisterView();
        
      }else{
        return DashboardView();
      }
    }
  );


}

