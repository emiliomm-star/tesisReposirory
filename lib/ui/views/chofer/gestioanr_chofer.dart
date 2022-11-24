// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, body_might_complete_normally_nullable

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimateproject/models/hiveModels/hive_chofer_model.dart';
import 'package:ultimateproject/providers/hive_providers/chofer_provider.dart';
import 'package:ultimateproject/router/router.dart';

class GestionarChofer extends StatefulWidget {

  @override
  State<GestionarChofer> createState() => _GestionarChoferState();
}

class _GestionarChoferState extends State<GestionarChofer> {

final TextEditingController name_controller = TextEditingController();
final TextEditingController job_controller  = TextEditingController();
final TextEditingController ci_controller   = TextEditingController();


final TextEditingController delete_controller  = TextEditingController();
final TextEditingController buscar_controller  = TextEditingController();

List<Chofer> listaChoferes = [];

ChoferOperations choferOperations = ChoferOperations();

 var _formKey =  GlobalKey<FormState>();


  @override
  void initState() {
    getData();

    super.initState();

  



    
  }

  @override
  void dispose() {
    super.dispose();
  ci_controller.dispose();
  name_controller.dispose();
  job_controller.dispose();
  delete_controller.dispose();
  buscar_controller.dispose();
  }

  Future<void> getData()async{
    listaChoferes = await choferOperations.choferesList;

   // setState(() {});

  }




  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      body: Column(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Container(
                width: 500,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      
                      TextFormField(
                        controller: name_controller,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          hintText: 'Nombre y Apellidos', 
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                          labelText: 'Nombre - Apellidos',
                          icon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'No deje campos vacios';
                          }
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: ci_controller,
                         keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          hintText: 'CI', 
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                          labelText: 'CI',
                          icon: Icon(Icons.numbers),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'No deje campos vacios';
                          }
                        },
                        
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: job_controller,
                         keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          hintText: 'Zona-Manzana', 
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                          labelText: 'Tarea',
                          icon: Icon(Icons.alt_route_outlined),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'No deje campos vacios';
                          }
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox( height: 150,),
          Container(
            padding: EdgeInsets.only(left: 100),
            child: Row(
              children: [
                ElevatedButton.icon(onPressed: () async{ // add

                 if (_formKey.currentState!.validate()) {
                    
                  await choferOperations.saveChofer(Chofer(ci: ci_controller.text, name: name_controller.text, job: job_controller.text));
                  //Mostrar una notificacion especificando q el chofer se creo correctamente
                 }
                 else{
                  print('Datos de chofer incorrectos');
                 }
                 await getData();
                 clear();
               //  print(listaChoferes.toList());
                
               
               

                }, 
                  icon: Icon(Icons.add),
                  label: Text('ADD')),

                SizedBox(width: 130,),

                ElevatedButton.icon(onPressed: ()async{ // dialog para borrar
                  showCupertinoDialog(
                    context: context, 
                    builder: (context){
                      return AlertDialog(
                        title: Center(
                          child: Column(
                            children: [
                              TextFormField(
                                validator: ((value) {
                                  if (value == null || value == '') {
                                    return 'Ingrese un ci';
                                  }
                                  if (value.length != 11) {
                                    return 'El numero de indentidad consta de 11 digitos';
                                  }                                }),
                                controller: delete_controller,
                                decoration: InputDecoration(
                                      labelText: 'CI-CHOFER',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      )
                                    ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  ElevatedButton.icon(onPressed: ()async{   //DELETE

                                    // Buscar en hive el chofer por CI y eliminar
                                   for (var i = 0; i < listaChoferes.length; i++) {
                                     if (listaChoferes[i].ci == delete_controller.text) {
                                       await listaChoferes[i].delete();
                                       getData();
                                       delete_controller.text = '';
                                       
                                     } 
                                   }
                                   
                                  },
                                   icon: Icon(Icons.delete), label: Text('Eliminar')),
                                   SizedBox(width: 10,),
                                   ElevatedButton.icon(onPressed: (){
                                    Navigator.pop(context);
                                   }, icon: Icon(Icons.close), label: Text('Cerrar'))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  );
                }, 
                   icon: Icon(Icons.delete), 
                   label: Text('DELETE')),

           
                   SizedBox( height: 100, width: 100,),
                   
                   ElevatedButton.icon(
                    onPressed: (() { //dialog de buscar vehiculo
                      showDialog(
                    context: context, 
                    builder: (context){
                      return AlertDialog(
                        title: Center(
                          child: Column(
                            
                            children: [
                              TextFormField(
                                
                                validator: (value) {
                                  if (value ==null || value == '') return 'Inngrese un ci';
                                    
                                  
                                  if (value.length != 11) return 'El ci debe tener 11 digitos';
                                    return null;
                                  
                                },
                                controller: buscar_controller,
                                
                                decoration: InputDecoration(
                                      labelText: 'CI-CHOFER',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      )
                                    ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                   ElevatedButton.icon(onPressed: (){ // BUSCAR
                             
                                    for (var i = 0; i < listaChoferes.length; i++) {
                                        if (listaChoferes[i].ci == buscar_controller.text) {
                                          showDialog(
                                            context: context, 
                                            builder: (context){
                                              return AlertDialog(
                                                    title: Center(
                                                      child: Column(
                                                        children: [
                                                          Center(child:Text('Nombre-Chofer        : ${listaChoferes[i].name}'),),
                                                          Center(child:Text('Numero-identidad     : ${listaChoferes[i].ci}'),),
                                                          Center(child:Text('Zona                 : ${listaChoferes[i].job}'),),

                                                          SizedBox(height: 10,),
                                                          ElevatedButton(
                                                            onPressed: (){
                                                              Navigator.pop(context);
                                                            }, 
                                                            child: Text('Cerrar')
                                                            )
                                                         
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                            }
                                            );
                                            setState(() {
                                            buscar_controller.text = '';
                                              
                                            });
                                        }
                                      }
                                   }, icon: Icon(Icons.search), label: Text('Buscar')),
                                   SizedBox(width: 10,),
                                    ElevatedButton.icon(onPressed: ()async{
                                      
                                    Navigator.pop(context);
                                  },
                                   icon: Icon(Icons.close), label: Text('Cerrar')),
                                 
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  );
                    }), 
                    icon: Icon(Icons.search), 
                    label: Text('Buscar')
                    )
                
                
              ],          
            ),
          )
        ],
      ),
    );
  }
//Despues de insertar deja los campos te texto en blanco
  void clear() {
    name_controller.text = '' ;
    ci_controller.text = '';
    job_controller.text = '';
    setState(() {
      
    });
  }
}