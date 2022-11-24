// ignore_for_file: use_key_in_widget_constructors, unused_import, duplicate_ignore, prefer_const_constructors, unused_local_variable, prefer_final_fields, unnecessary_import, body_might_complete_normally_nullable, avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:ultimateproject/models/hiveModels/hive_chofer_model.dart';
import 'package:ultimateproject/providers/hive_providers/chofer_provider.dart';

class UpdatePage extends StatefulWidget {
  

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  final TextEditingController name_controller_2 = TextEditingController();
  final TextEditingController ci_controller_2 = TextEditingController();
  final TextEditingController job_controller_2 = TextEditingController();

  final String namePrima = Get.arguments['Nombre y Apellidos'];
  final String ciPrima = Get.arguments['Centro'];
  final String jobPrima = Get.arguments['Promedio'];

  var _formKey =  GlobalKey<FormState>();

  


@override
void initState() {
 
  super.initState();
  
}

@override
  void dispose() {
    name_controller_2.dispose();
    ci_controller_2.dispose();
    job_controller_2.dispose();
    super.dispose();
  }

  final ChoferOperations hiveData =  ChoferOperations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifique datos del estudiante'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
            height: 200,
          ),
          TextFormField(
            validator: (value){
              if (value!.isEmpty) {
                return 'No deje este campo vacio';
              }
            },
            controller: name_controller_2,
            decoration: InputDecoration(
              labelText: namePrima,
             
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )
            ),
            
            
            
          ),
          SizedBox(height: 15,),
          
          SizedBox(height: 15,),
           TextFormField(
             validator: (value){
              if (value!.isEmpty) {
                return 'No deje este campo vacio';
              }
            },
             controller: ci_controller_2,
            decoration: InputDecoration(
              labelText: ciPrima,
              
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )
            ),
            
          ),
              ],
            ),
            ),

          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () async{ 

                        if (_formKey.currentState!.validate()) {
                          final Box<Chofer> box = await Hive.openBox<Chofer>('estudiantes');

                        var lista = await hiveData.choferesList;

                        for (var i = 0; i < lista.length; i++) {
                          if (lista[i].name == namePrima && lista[i].ci == ciPrima && lista[i].job == jobPrima) {
                             
                             lista[i].name = name_controller_2.text;
                             lista[i].save();
                             lista[i].ci = ci_controller_2.text;
                             lista[i].save();
                             lista[i].job = job_controller_2.text;
                             lista[i].save();
                           } 
                          
                        }
                        Get.toNamed('listado');
                        Get.snackbar('Notificacion', 'Los datos del estudiante han sido modificados con exito', 
                        animationDuration: Duration(milliseconds: 3000),
                        backgroundColor: Colors.black.withOpacity(0.9),
                        colorText: Colors.white
                        );
                              
                            
                            
                        }
                          
                        
                    },
                  
                   
            child: Container(
              
              padding: EdgeInsets.all(40),
              child: Text('Modificar', style: TextStyle(fontSize: 20),),
              
              ),

            )
        ],
      ),
      
    );
    
  }
 
}