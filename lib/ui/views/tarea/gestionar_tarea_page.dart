import 'package:flutter/material.dart';
import 'package:ultimateproject/models/hiveModels/hive_tarea_model.dart';
import 'package:ultimateproject/providers/hive_providers/tarea_provider.dart';

class GestionarTarea extends StatefulWidget {

  @override
  State<GestionarTarea> createState() => _GestionarTareaState();
}

class _GestionarTareaState extends State<GestionarTarea> {

  var _formKey =  GlobalKey<FormState>();

  List<Tarea> listaTareas = [];


  TareaOperations tareasOperations = TareaOperations();

final TextEditingController name_controller = TextEditingController();
final TextEditingController job_controller  = TextEditingController();


final TextEditingController delete_controller  = TextEditingController();
final TextEditingController buscar_controller  = TextEditingController();

@override
void dispose() {
  name_controller.dispose();
  job_controller.dispose();
  super.dispose();
}

Future<void> getData()async{
    listaTareas = await tareasOperations.tareasList;

   // setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: Text('Gestionar Tarea'),
        actions: [
          Row(
            children: [
               SizedBox(width: 15,),
                Container(
                  child: Text('Buscar', style: TextStyle(fontSize: 20),),
                ),
                IconButton(
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context){
                      return AlertDialog(
                        title: Center(
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                      labelText: 'Zona',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      )
                                    ),
                              ),
                              SizedBox(height: 10,),
                              ElevatedButton.icon(onPressed: (){
                                // Buscar en hive el chofer por CI
                                Navigator.pop(context);
                              },
                               icon: Icon(Icons.search), label: Text('Mostrar'))
                            ],
                          ),
                        ),
                      );
                    }
                  );
                }, 
                icon: Icon(Icons.search)
                )
            ],
          )
        ],
      ),*/
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
                        controller: job_controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          hintText: 'Manzana', 
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                          labelText: 'Zona',
                          icon: Icon(Icons.numbers),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: name_controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          hintText: 'Nombre', 
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                          labelText: 'Chofer-Correspondiente',
                          icon: Icon(Icons.drive_eta),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox( height: 150,),
          Container(
            padding: EdgeInsets.only(left: 150),
            child: Row(
              children: [
                ElevatedButton.icon(onPressed: ()async{
                  if (_formKey.currentState!.validate()) {
                    await tareasOperations.saveTarea(Tarea(name: name_controller.text, zona: job_controller.text));
                  }
                  else{
                    print('Datos incorrectos');
                  }
                  await getData();
                  clear();
                  
                }, 
                icon: Icon(Icons.add), 
                label: Text('ADD')
                ),

                SizedBox(width: 130,),
                
                ElevatedButton.icon(onPressed: ()async{
                     for (var i = 0; i < listaTareas.length; i++) {
                         if (listaTareas[i].name == delete_controller.text) {
                           await listaTareas[i].delete();
                           getData();
                           delete_controller.text = '';
                                       
                                     } 
                                   }
                }, 
                icon: Icon(Icons.delete), 
                label: Text('DELETE')
                ),

                SizedBox(width: 130,),

                ElevatedButton.icon(onPressed: (){}, 
                icon: Icon(Icons.delete), 
                label: Text('Buscar')
                ),
                
                
              ],          
            ),
          )
        ],
      ),
    );
  }
    void clear() {
    name_controller.text = '' ;
    job_controller.text = '';
    setState(() {
      
    });
  }
}

