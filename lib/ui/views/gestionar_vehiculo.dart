import 'package:flutter/material.dart';

class GestionarVehiculo extends StatefulWidget {

  @override
  State<GestionarVehiculo> createState() => _GestionarVehiculoState();
}

class _GestionarVehiculoState extends State<GestionarVehiculo> {

  var _formKey =  GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
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
            padding: EdgeInsets.only(left: 400),
            child: Row(
              children: [
                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('ADD')),
                SizedBox(width: 130,),
                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.delete), label: Text('DELETE')),
                
                
              ],          
            ),
          )
        ],
      ),);
  }
}