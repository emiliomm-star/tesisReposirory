import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/ui/views/reportView.dart';

import '../providers/auth_providers.dart';
import '../ui/views/login_view.dart';

class ReportHandlers {
  static Handler report = Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return ReportView ();
        
      }else{
        return LoginView();
      }
    }
  );
}