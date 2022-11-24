import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimateproject/models/hiveModels/hive_tarea_model.dart';
import 'package:ultimateproject/providers/hive_providers/tarea_provider.dart';

import '../../../router/router.dart';

class TareaList extends StatefulWidget {

  @override
  State<TareaList> createState() => _TareaListState();
}

class _TareaListState extends State<TareaList> {

   TareaOperations tareaProvider = TareaOperations();

   TextEditingController ci_controller_3   = TextEditingController();
   TextEditingController job_controller3   = TextEditingController();

//Lista de TareaModel
   List<Tarea> lista_tareas = [];
      
    var _formKey =  GlobalKey<FormState>();


     Future <List<Tarea>> getLista() async{
    lista_tareas = await tareaProvider.tareasList;
    return lista_tareas;
    
  }

@override
void dispose() {
  ci_controller_3.dispose();
  job_controller3.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Listado-Tareas'),),
      body: FutureBuilder(
        future: tareaProvider.tareasList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
           if (ConnectionState == ConnectionState.waiting) {
               return const Center(child: CircularProgressIndicator());
      }

              return ListView.builder(
                itemCount: snapshot.data?.length  ?? 0,
                itemBuilder: (context, index){
                  return ListTile(
                        title:    Text(snapshot.data![index].name),
                        trailing: Text(snapshot.data![index].zona),
                        
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
                                    Flurorouter.tareasListRoute,
                                    arguments: {
                                       'Nombre y Apellidos-tarea'  : snapshot.data![index].name,
                                       'Zona-tarea'                : snapshot.data![index].zona,
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