

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_providers.dart';
import '../ui/views/vehiculo/gestionar_vehiculo.dart';
import '../ui/views/login_view.dart';

class GvehiculoHandlers {
  static Handler gvehiculo = Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return GestionarVehiculo();
        
      }else{
        return LoginView();
      }
    }
  );
}