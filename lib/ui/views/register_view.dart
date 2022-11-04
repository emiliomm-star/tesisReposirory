// ignore_for_file: unnecessary_null_comparison, use_key_in_widget_constructors, prefer_const_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import '../../providers/register_form_provider.dart';
import '../../router/router.dart';
import '../buttons/custom_outlined_button.dart';
import '../buttons/link_text.dart';
import '../inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context){

        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints( maxWidth: 370 ),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: registerFormProvider.formKey,
              child: Column(
                children: [
    
                  TextFormField(
                    onChanged: (value) {
                      registerFormProvider.ci = value;
                    },
                     validator: (value){
                      if (value!.isEmpty || value.length < 11|| value == null) return 'Numero de carnet no valido';
                      return null;
                        
                      
                     },
                    style: TextStyle( color: Colors.white ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su numero de carnet',
                      label: 'ci',
                      icon: Icons.numbers
                    ),
                  ),
    
                  SizedBox( height: 20 ),
    
                  TextFormField(
                    onChanged: (value) => registerFormProvider.name = value,
                     validator: (value){
                      if (value == null || value.isEmpty) return'Nombre no valido';

                     },
                    style: TextStyle( color: Colors.white ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su nombre',
                      label: 'Nombre',
                      icon: Icons.supervised_user_circle_sharp
                    ),
                  ),
    
                  SizedBox( height: 20 ),
                  
                  
    
                  // Password
                  TextFormField(
                    onChanged: (value) => registerFormProvider.password = value,
                     validator: (value){
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Contraseña no valida';
                      } else{
                        return null;
                      }
                     },
                    obscureText: true,
                    style: TextStyle( color: Colors.white ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: '*********',
                      label: 'Contraseña',
                      icon: Icons.lock_outline_rounded
                    ),
                  ),
                  
                  SizedBox( height: 20 ),
                  CustomOutlinedButton(
                    onPressed: () {
                      registerFormProvider.validatorForm(); 
                    }, 
                    text: 'Crear cuenta',
                  ),
    
    
                  SizedBox( height: 20 ),
                  LinkText(
                    text: 'Ir al login',
                    onPressed: () {
                      Navigator.pushNamed(context, Flurorouter.loginRoute );
                    },
                  )
    
                ],
              )
            ),
          ),
        ),
      );
      })
    );
  }

  
}