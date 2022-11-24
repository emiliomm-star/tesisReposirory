
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/ui/views/tarea/tarea_list.dart';

import '../providers/auth_providers.dart';
import '../ui/views/login_view.dart';

class TareaListHandlers {
  static Handler tareaList = Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return TareaList();
        
      }else{
        return LoginView();
      }
    }
  );

}