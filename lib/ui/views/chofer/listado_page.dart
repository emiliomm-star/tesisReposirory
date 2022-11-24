//import 'dart:html';

// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ultimateproject/models/hiveModels/hive_chofer_model.dart';
import 'package:ultimateproject/providers/hive_providers/chofer_provider.dart';
import 'package:ultimateproject/router/chofer_list_handler.dart';
import 'package:ultimateproject/router/router.dart';
import 'package:ultimateproject/ui/views/chofer/chofer_update_page.dart';
import 'package:ultimateproject/ui/views/map_page.dart';
class ListadoPage extends StatefulWidget {
  const ListadoPage({super.key});

  @override
  State<ListadoPage> createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {

  ChoferOperations choferOperations = ChoferOperations();

 TextEditingController ci_controller_2   = TextEditingController();
 TextEditingController name_controller2   = TextEditingController();
 TextEditingController job_controller2   = TextEditingController();

  List<Chofer> lista_choferes = [];

   var _formKey =  GlobalKey<FormState>();
   var _formKey1 =  GlobalKey<FormState>();

@override
void initState() {
  super.initState();
  
}
@override
void dispose() {
  ci_controller_2.dispose();
  name_controller2.dispose();
 job_controller2.dispose();
  super.dispose();
}

  Future <List<Chofer>> getLista() async{
    lista_choferes = await choferOperations.choferesList;
    return lista_choferes;
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado'),
      /*  actions: [
        /*  IconButton(onPressed: (){
            showDialog(context: context,
            builder: (context) {
              
              return AlertDialog(
                
                title: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                             decoration: InputDecoration(
                                         labelText: 'ci-chofer',
                                         border: OutlineInputBorder(
                                           borderRadius: BorderRadius.all(Radius.circular(20))
                                         )
                                       ),
                        controller: ci_controller_2,
                          validator: (value){
              if (value!.isEmpty) {
                return 'No deje este campo vacio';
              }
            },
           
              ),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: ()async{
                        if (_formKey.currentState!.validate()) {
                          final Box<Chofer> box = await Hive.openBox<Chofer>('choferes');
                          var lista = await choferOperations.choferesList;
                          for (var i = 0; i < lista.length; i++) {
                            if (lista[i].ci == ci_controller_2.text) {
                              showDialog(context: context, 
                              builder: ((context) {
                                return AlertDialog(
                                  title: Form(
                                    key: _formKey1,
                                    child: Center(
                                      child: Column(
                                        children: [
                                      TextFormField(
                                          decoration: InputDecoration(
                                         labelText: 'nombre-chofer',
              
              
                                         border: OutlineInputBorder(
                                           borderRadius: BorderRadius.all(Radius.circular(20))
                                         )
                                       ),
                                      controller: name_controller2,
                                        validator: (value){
                                       if (value!.isEmpty) {
                                           return 'No deje este campo vacio';
                                        }
            },
           
              ),
                                 SizedBox(height: 20,),
                                      TextFormField(
                                             decoration: InputDecoration(
                                         labelText: 'ci-chofer',
              
              
                                         border: OutlineInputBorder(
                                           borderRadius: BorderRadius.all(Radius.circular(20))
                                         )
                                       ),
                                      controller: ci_controller_2,
                                        validator: (value){
                                       if (value!.isEmpty) {
                                           return 'No deje este campo vacio';
                                        }
            },
           
              ),
                                 SizedBox(height: 20,),
                                      TextFormField(
                                             decoration: InputDecoration(
                                         labelText: 'tarea-chofer',
              
              
                                         border: OutlineInputBorder(
                                           borderRadius: BorderRadius.all(Radius.circular(20))
                                         )
                                       ),
                                      controller: job_controller2,
                                        validator: (value){
                                       if (value!.isEmpty) {
                                           return 'No deje este campo vacio';
                                        }
            },
           
              ),
                                 SizedBox(height: 20,),

                                 ElevatedButton.icon(
                                  onPressed: (){
                                   if (_formKey1.currentState!.validate()) {
                                     for (var i = 0; i < lista.length; i++) {
                                       if (lista[i].ci == ci_controller_2.text) {
                                         lista[i].name = name_controller2.text;
                                         lista[i].save();
                                         lista[i].ci = ci_controller_2.text;
                                         lista[i].save();
                                         lista[i].job = job_controller2.text;
                                         lista[i].save();
                                       }
                                     }
                                     getLista();
                                   }
                                  }, 
                                  icon: Icon(Icons.update_outlined), 
                                  label: Text('Actualizar')
                                  )
                                        ],
                                      ),
                                    )
                                    
                                    ),
                                );
                              })
                              );
                            }
                          }
                        }
                      }, 
                      child: Text('Actualizar')
                      )
                    ]
                  )
                  ),
              );
            },
            );
          }, icon: Icon(Icons.update))*/
        ],
        */),
      body: FutureBuilder(
        future: choferOperations.choferesList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
           if (ConnectionState == ConnectionState.waiting) {
               return const Center(child: CircularProgressIndicator());
      }

              return ListView.builder(
                itemCount: snapshot.data?.length  ?? 0,
                itemBuilder: (context, index){
                  return ListTile(
                        title:    Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].ci),
                        trailing: Text(snapshot.data![index].job),
                    onLongPress: () {
                      showDialog(context: context, 
                      builder: ((context) {
                        return AlertDialog(
                          title: Center(
                            child: MaterialButton(
                                  key: Key(snapshot.data![index].hashCode.toString()),
                                   child: Text('Modificar'),
                              onPressed: (){
                                Get.back();
                                   Get.toNamed(
                                    Flurorouter.updatePage,
                                    arguments: {
                                       'Nombre y Apellidos'  : snapshot.data![index].name,
                                       'Carnet'              : snapshot.data![index].ci,
                                       'Zona'                : snapshot.data![index].job,
                                    }
                                    );
                                  }
                              ),
                           ),
                        );
                      })
                      );
                    },

                  );
                }
                );
        },
      ),
    );  
  }
  
/* Widget _Listado() {

  return ListView.builder(
    itemBuilder: itemBuilder
    );
 }*/
}