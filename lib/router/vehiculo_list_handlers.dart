
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/ui/views/vehiculo/vehiculo_list_view.dart';

import '../providers/auth_providers.dart';
import '../ui/views/login_view.dart';

class VehiculoListHandlers {
  static Handler vehiculoList = Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return Vehiculolist();
        
      }else{
        return LoginView();
      }
    }
  );

}