
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_providers.dart';
import '../ui/views/dashboard_view.dart';
import '../ui/views/login_view.dart';



class DahsboardHandlers {

  static Handler dashborad = Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return DashboardView();
        
      }else{
        return LoginView();
      }
    }
  );

  


}

    
    
    


