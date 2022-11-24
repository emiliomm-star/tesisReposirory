// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ultimateproject/models/hiveModels/hive_chofer_model.dart';
import 'package:ultimateproject/providers/hive_providers/chofer_provider.dart';
import 'package:ultimateproject/router/router.dart';

class UpdateChoferPage extends StatefulWidget {
  const UpdateChoferPage({super.key});

  @override
  State<UpdateChoferPage> createState() => _UpdateChoferPageState();
}

class _UpdateChoferPageState extends State<UpdateChoferPage> {

  final TextEditingController controller_auxChofer = TextEditingController();
  final TextEditingController ci_controller_auxChofer = TextEditingController();
  final TextEditingController job_controller_auxChofer = TextEditingController();

  final String namePrimaChofer = Get.arguments['Nombre y Apellidos'];
  final String ciPrimaChofer = Get.arguments['Carnet'];
  final String jobPrimaChofer = Get.arguments['Zona'];

    var _formKey =  GlobalKey<FormState>();



    final ChoferOperations hiveData =  ChoferOperations();

@override
void dispose() {
  
  controller_auxChofer.dispose();
  ci_controller_auxChofer.dispose();
  job_controller_auxChofer.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar'),
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
            controller: controller_auxChofer,
            decoration: InputDecoration(
              labelText: namePrimaChofer,
             
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )
            )),
                   TextFormField(
            validator: (value){
              if (value!.isEmpty) {
                return 'No deje este campo vacio';
              }
            },
            controller: ci_controller_auxChofer,
            decoration: InputDecoration(
              labelText: ciPrimaChofer,
             
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )
            )),
                   TextFormField(
            validator: (value){
              if (value!.isEmpty) {
                return 'No deje este campo vacio';
              }
            },
            controller: job_controller_auxChofer,
            decoration: InputDecoration(
              labelText: jobPrimaChofer,
             
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )
            ),
            
            
            
          ),
          SizedBox(height: 10,),

          ElevatedButton(
            onPressed: ()async{
              if (_formKey.currentState!.validate()) {

                          final Box<Chofer> box = await Hive.openBox<Chofer>('choferes');

                        var lista = await hiveData.choferesList;

                        for (var i = 0; i < lista.length; i++) {
                          if (lista[i].name == namePrimaChofer && lista[i].ci == ciPrimaChofer && lista[i].job == jobPrimaChofer) {
                             
                             lista[i].name = controller_auxChofer.text;
                             lista[i].save();
                             lista[i].ci = ci_controller_auxChofer.text;
                             lista[i].save();
                             lista[i].job = job_controller_auxChofer.text;
                             lista[i].save();
                           } 
                          
                        }
                        Get.toNamed(Flurorouter.choferListRoute);
                        Get.snackbar('Notificacion', 'Los datos de los choferes han sido modificados con exito', 
                        animationDuration: Duration(milliseconds: 3000),
                        backgroundColor: Colors.black.withOpacity(0.9),
                        colorText: Colors.white
                        );

                        clear();
                              
                            
                            
                        }
            }, 
            child: Text('Aceptar')
            )
                 ],
            )
            )
        ],
      ),
    );
    
  }
   void clear() {
    controller_auxChofer.text = '' ;
    ci_controller_auxChofer.text = '';
    job_controller_auxChofer.text = '';
    setState(() {
      
    });
  }
}