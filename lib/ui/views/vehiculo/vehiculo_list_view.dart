import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimateproject/models/hiveModels/hive_vehiculo_model.dart';
import 'package:ultimateproject/providers/hive_providers/vehiculo_provider.dart';

import '../../../router/router.dart';

class Vehiculolist extends StatefulWidget {

  @override
  State<Vehiculolist> createState() => _VehiculolistState();
}

class _VehiculolistState extends State<Vehiculolist> {

  VehiculoOperations vehiculoOperations = VehiculoOperations();

  TextEditingController chapa_controller_2   = TextEditingController();
  
  List<VehiculoModel> lista_vehiculos = [];

   var _formKey =  GlobalKey<FormState>();


   @override
   void dispose() {
     chapa_controller_2.dispose();
     super.dispose();
   }

   Future <List<VehiculoModel>> getLista() async{
    lista_vehiculos = await vehiculoOperations.vehiculosList;
    return lista_vehiculos;
    
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
        future: vehiculoOperations.vehiculosList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
           if (ConnectionState == ConnectionState.waiting) {
               return const Center(child: CircularProgressIndicator());
      }

              return ListView.builder(
                itemCount: snapshot.data?.length  ?? 0,
                itemBuilder: (context, index){
                  return ListTile(
                        title:    Text(snapshot.data![index].chapa),
                        
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
                                       'Chapa-Vehiculo'  : snapshot.data![index].chapa,
                                       
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
}