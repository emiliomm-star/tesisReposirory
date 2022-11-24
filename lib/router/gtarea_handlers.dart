




import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/ui/views/tarea/gestionar_tarea_page.dart';

import '../providers/auth_providers.dart';
import '../ui/views/login_view.dart';

class GtareaHandlers {
  static Handler gtarea = Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return GestionarTarea();
        
      }else{
        return LoginView();
      }
    }
  );
}