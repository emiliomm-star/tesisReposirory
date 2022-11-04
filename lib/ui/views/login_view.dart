
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, body_might_complete_normally_nullable

import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import '../../providers/auth_providers.dart';
import '../../providers/login_form_provider.dart';
import '../../router/router.dart';
import '../buttons/custom_outlined_button.dart';
import '../buttons/link_text.dart';
import '../inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

      final authProvider = Provider.of<AuthProvider>(context); 


    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context){

    final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

    return Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.symmetric( horizontal: 20 ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints( maxWidth: 370 ),
              child: Form(
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
                    
                    // Email
                    TextFormField(
                      onChanged: (value) {
                        loginFormProvider.name = value;
                      },
                       validator: (value){
                        if (value == '') {
                          return 'Usuario no valido';
                        }
                       },
                      style: TextStyle( color: Colors.white ),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su nombre y apellidos',
                        label: 'Usuario',
                        icon: Icons.person
                      ),
                    ),
      
                    SizedBox( height: 20 ),
      
      
      
                    // Password
                    TextFormField(
                      onChanged: (value){
                        loginFormProvider.password = value;
                      },
                       validator: (value){
                        //Metodo validar contraseña para prueba unitaria
                        if (value == null || value.isEmpty) return 'Ingrese contraseña';
                        if (value.length < 6) return 'La contraseña debe ser mayor de 6 caracteres';
                        return null;
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
                      //  Navigator.pushNamed( context, '' );
                        final isValid = loginFormProvider.validatorForm();
                        if (isValid) {
                          authProvider.login(loginFormProvider.name, loginFormProvider.password);
                        }
                      }, 
                      text: 'Ingresar',
                    ),
      
      
                    SizedBox( height: 20 ),
                    LinkText(
                      text: 'Nueva cuenta',
                      onPressed: () {
                        Navigator.pushNamed( context, Flurorouter.registerRoute );
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