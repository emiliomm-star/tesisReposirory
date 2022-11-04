import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String name     = '';
  String password = '';


  bool validatorForm(){
    if (formKey.currentState!.validate()) {
    //  print('Formulario valido');
      //print('$name === $password'); 
      return true;
    } else {
    //  print('Formulario no valido');
      return false;
    }
  }
}