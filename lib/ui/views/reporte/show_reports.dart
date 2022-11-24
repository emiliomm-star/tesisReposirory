// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:ultimateproject/models/hiveModels/hive_reporte_model.dart';
import 'package:ultimateproject/router/router.dart';
import 'package:ultimateproject/services/navigation-services.dart';

import '../../../providers/hive_providers/report_provider.dart';

class MostrarReportes extends StatefulWidget {

  @override
  State<MostrarReportes> createState() => _MostrarReportesState();
}

class _MostrarReportesState extends State<MostrarReportes> {

  var _formKey =  GlobalKey<FormState>();

  final TextEditingController autor_controller = TextEditingController();
  final TextEditingController report_controller   = TextEditingController();

  final TextEditingController delete_controller = TextEditingController();
  final TextEditingController buscar_controller = TextEditingController();

  List<ReporteModel> listReportes = [];

  ReportProvider reportProvider = ReportProvider();

  @override
  void initState() {
    getData();
    super.initState();
    
  }

@override
  void dispose() {
    autor_controller.dispose();
    report_controller.dispose();
    delete_controller.dispose();
    buscar_controller.dispose();
    super.dispose();
  }

  Future<void> getData()async{
    listReportes = await reportProvider.reportesList;

   // setState(() {});

  }


  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          NavigationServices.navigateTo(Flurorouter.mapRoute);
        }, 
        icon: Icon(Icons.map_outlined)
        ),
        
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
                                
                                validator: (value) {
                                  if (value ==null || value == '') return 'Inngrese un ci';
                                    
                                  
                                  if (value.length != 11) return 'El ci debe tener 11 digitos';
                                    return null;
                                  
                                },
                                controller: buscar_controller,
                                
                                decoration: InputDecoration(
                                      labelText: 'Autor',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      )
                                    ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                   ElevatedButton.icon(onPressed: (){
                                     for (var i = 0; i < listReportes.length; i++) {
                                        if (listReportes[i].autor == buscar_controller.text) {
                                          showDialog(
                                            context: context, 
                                            builder: (context){
                                              return AlertDialog(
                                                    title: Center(
                                                      child: Column(
                                                        children: [
                                                          Center(child:Text('Nombre-autor        : ${listReportes[i].autor}'),),
                                                          Center(child:Text('reporte     :  \n \n ${listReportes[i].text}'),),

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
                      
                      TextFormField(
                        controller: autor_controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          hintText: 'Nombre-Chofer+', 
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                          labelText: 'Autor',
                          icon: Icon(Icons.person),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: report_controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          hintText: 'Cuerpo-Reporte', 
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                          labelText: 'Reporte',
                          icon: Icon(Icons.report_problem),
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
                ElevatedButton.icon(onPressed: ()async{

                  if (_formKey.currentState!.validate()) {
                    await reportProvider.saveReport(ReporteModel(autor: autor_controller.text, text: report_controller.text));

                    getData();
                      setState(() {
                         autor_controller.text = '' ;
                         report_controller.text = '';
                      });
                  }




                }, 
                icon: Icon(Icons.add), 
                label: Text('ADD')
                ),
                SizedBox(width: 130,),
                
                ElevatedButton.icon(onPressed: ()async{
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
                                    return 'Ingrese un autor de reporte';
                                  }
                               }),
                                controller: delete_controller,
                                decoration: InputDecoration(
                                      labelText: 'Autor-Reporte',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      )
                                    ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  ElevatedButton.icon(onPressed: ()async{
                                    // Buscar en hive el chofer por CI y eliminar
                                   for (var i = 0; i < listReportes.length; i++) {
                                     if (listReportes[i].autor == delete_controller.text) {
                                       await listReportes[i].delete();
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
                
                
              ],          
            ),
          )
        ],
      ),
      
    );
    
  }
   void clear() {
    autor_controller.text = '' ;
    report_controller.text = '';
    setState(() {
      
    });
  }
}