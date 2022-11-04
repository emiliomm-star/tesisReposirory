// ignore_for_file: file_names, unused_import

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/ui/views/chofer_page.dart';

import '../providers/auth_providers.dart';
import '../ui/views/login_view.dart';

class ChoferPageHandlers {
  static Handler chofer= Handler(
    handlerFunc: ( context, params ) {
    final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return ChoferPage();
        
      }else{
        return LoginView();
      }
    }
  );
}