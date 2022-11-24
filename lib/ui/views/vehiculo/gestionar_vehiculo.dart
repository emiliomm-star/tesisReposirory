import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ultimateproject/models/hiveModels/hive_vehiculo_model.dart';
import 'package:ultimateproject/providers/hive_providers/vehiculo_provider.dart';

class GestionarVehiculo extends StatefulWidget {

  @override
  State<GestionarVehiculo> createState() => _GestionarVehiculoState();
}

class _GestionarVehiculoState extends State<GestionarVehiculo> {

  var _formKey =  GlobalKey<FormState>();

  final TextEditingController chapa_controller = TextEditingController();

  final TextEditingController delete_controllerVehiculo  = TextEditingController();
  final TextEditingController buscar_controllerVehiculo  = TextEditingController();

List<VehiculoModel> listaVehiculos = [];

 VehiculoOperations vehiculoOperations = VehiculoOperations();

 @override
 void dispose() {
   delete_controllerVehiculo.dispose();
   buscar_controllerVehiculo.dispose();
   chapa_controller.dispose();
   super.dispose();
 }

 Future<void> getData()async{
    listaVehiculos = await vehiculoOperations.vehiculosList;

   // setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: Text('Gestionar Vehiculo'),
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
                                      labelText: 'Chapa',
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
                      
                      

                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: chapa_controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          hintText: 'Chapa', 
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                          labelText: 'Chapa',
                          icon: Icon(Icons.numbers),
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
                    
                  await vehiculoOperations.saveVehiculo(VehiculoModel(chapa: chapa_controller.text));
                  //Mostrar una notificacion especificando q el vehiculo se creo correctamente
                 }
                   else{
                  print('Datos de vehiculo incorrectos');
                 }

                 await getData();

                 clear();


                }, icon: Icon(Icons.add), label: Text('ADD')),
                SizedBox(width: 130,),

                ElevatedButton.icon(onPressed: (){

                  showDialog(
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
                                controller: delete_controllerVehiculo,
                                decoration: InputDecoration(
                                      labelText: 'Chapa',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      )
                                    ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  ElevatedButton.icon(onPressed: ()async{   //DELETE

                                    // Buscar en hive el vehiculo por chapa y eliminar
                                   for (var i = 0; i < listaVehiculos.length; i++) {
                                     if (listaVehiculos[i].chapa == delete_controllerVehiculo.text) {
                                       await listaVehiculos[i].delete();
                                       await getData();
                                       delete_controllerVehiculo.text = '';
                                       
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
                }, icon: Icon(Icons.delete), label: Text('DELETE')),

                SizedBox(width: 130,),

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
                                  if (value ==null || value == '') return 'Inngrese una chapa';

                                                return null;
                          
                                  
                                },
                                controller: buscar_controllerVehiculo,
                                
                                decoration: InputDecoration(
                                      labelText: 'Chapa',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      )
                                    ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                   ElevatedButton.icon(onPressed: (){ // BUSCAR
                             
                                    for (var i = 0; i < listaVehiculos.length; i++) {
                                        if (listaVehiculos[i].chapa == buscar_controllerVehiculo.text) {
                                          showDialog(
                                            context: context, 
                                            builder: (context){
                                              return AlertDialog(
                                                    title: Center(
                                                      child: Column(
                                                        children: [
                                                          Center(child:Text('Chapa-Vehiculo        : ${listaVehiculos[i].chapa}'),),
                                                       

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
                                            buscar_controllerVehiculo.text = '';
                                              
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
                    ),
                
                

                      SizedBox(width: 10,),

             

                
                
              ],          
            ),
          )
        ],
      ),);
  }
  
  void clear() {
    setState(() {
   chapa_controller.text = '';
      
    });
  }
}