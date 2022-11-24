import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ultimateproject/models/hiveModels/hive_tarea_model.dart';
import 'package:ultimateproject/providers/hive_providers/tarea_provider.dart';

import '../../../router/router.dart';


class UpdateTareaPage extends StatefulWidget {
  const UpdateTareaPage({super.key});

  @override
  State<UpdateTareaPage> createState() => _UpdateTareaPageState();
}

class _UpdateTareaPageState extends State<UpdateTareaPage> {

    final TextEditingController controller_auxTarea = TextEditingController();
    final TextEditingController job_controller_auxTarea = TextEditingController();

    final String namePrimaTarea = Get.arguments['Nombre y Apellidos-tarea'];
    final String jobPrimaTarea = Get.arguments['Zona-tarea'];

    var _formKey =  GlobalKey<FormState>();

    final TareaOperations hiveData =  TareaOperations();

    @override
    void dispose() {
      controller_auxTarea.dispose();
      job_controller_auxTarea.dispose();
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
            child: Form(
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
            controller: controller_auxTarea,
            decoration: InputDecoration(
              labelText: namePrimaTarea,
             
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
            controller: job_controller_auxTarea,
            decoration: InputDecoration(
              labelText: jobPrimaTarea,
             
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )
            )),
            SizedBox(height: 10,),

            ElevatedButton(
              onPressed: ()async{
                if (_formKey.currentState!.validate()) {

                          final Box<Tarea> box = await Hive.openBox<Tarea>('tareas');

                        var lista = await hiveData.tareasList;

                        for (var i = 0; i < lista.length; i++) {
                          if (lista[i].name == namePrimaTarea && lista[i].zona == jobPrimaTarea) {
                             
                             lista[i].name = controller_auxTarea.text;
                             lista[i].save();
                             lista[i].zona = job_controller_auxTarea.text;
                             lista[i].save();
                           } 
                          
                        }
                        Get.toNamed(Flurorouter.tareasListRoute);
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
            )
        ],
      ),
    );
  }
    void clear() {
    controller_auxTarea.text = '' ;
    job_controller_auxTarea.text = '';
    setState(() {
      
    });
  }
}