import 'package:flutter/material.dart';
import 'package:ultimateproject/models/hiveModels/hive_reporte_model.dart';
import 'package:ultimateproject/providers/hive_providers/report_provider.dart';

class ReportView extends StatefulWidget {

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {

   ReportProvider reportProvider = ReportProvider();

  List<ReporteModel> lista_reportes = [];

  Future <List<ReporteModel>> getLista() async{
    lista_reportes = await reportProvider.reportesList;
    return lista_reportes;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listado-Reportes'),),
      body: FutureBuilder(
        future: reportProvider.reportesList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
           if (ConnectionState == ConnectionState.waiting) {
               return const Center(child: CircularProgressIndicator());
      }

              return ListView.builder(
                itemCount: snapshot.data?.length  ?? 0,
                itemBuilder: (context, index){
                  return ListTile(
                        title:    Text(snapshot.data![index].autor),
                        trailing: Container(
                          child: ElevatedButton(onPressed: (){
                                          showDialog(
                                            context: context, 
                                            builder: (context){
                                              return AlertDialog(
                                                    title: Center(
                                                      child: Column(
                                                        children: [
                                                         
                                                          Center(child:Text('Reporte     :  \n \n ${snapshot.data![index].text}'),),

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
                          }, child: Text('Ver Reportes')),
                        ),
                       
                  );
                }
                );
        },
      ),
     // body: _Listado(),
    );
  }
}