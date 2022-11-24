//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ultimateproject/models/hiveModels/hive_chofer_model.dart';
import 'package:ultimateproject/providers/hive_providers/chofer_provider.dart';
class ListadoPage extends StatefulWidget {
  const ListadoPage({super.key});

  @override
  State<ListadoPage> createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {

  ChoferOperations choferOperations = ChoferOperations();

  List<Chofer> lista_choferes = [];

  Future <List<Chofer>> getLista() async{
    lista_choferes = await choferOperations.choferesList;
    return lista_choferes;
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listado'),),
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
                  );
                }
                );
        },
      ),
     // body: _Listado(),
    );
  }
  
/* Widget _Listado() {

  return ListView.builder(
    itemBuilder: itemBuilder
    );
 }*/
}