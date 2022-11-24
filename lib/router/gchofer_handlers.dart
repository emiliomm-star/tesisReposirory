


import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/ui/views/chofer/gestioanr_chofer.dart';

import '../providers/auth_providers.dart';
import '../ui/views/login_view.dart';

class GchoferHandlers {
  static Handler gchofer = Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return GestionarChofer();
        
      }else{
        return LoginView();
      }
    }
  );
}
