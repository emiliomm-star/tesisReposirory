// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  

  String name     = '';
  String password = '';
  String ci = '';

  validatorForm(){
    if (formKey.currentState!.validate()) {
      print('Formulario valido');
      print('$name === $password === $ci');
    } else {
      print('Formulario no valido');
    }
  }
}