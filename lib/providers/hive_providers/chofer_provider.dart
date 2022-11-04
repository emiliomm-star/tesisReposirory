// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ultimateproject/models/hiveModels/hive_chofer_model.dart';


class ChoferOperations extends HiveObject{
 ChoferOperations();
  
   Future<int> saveChofer(Chofer chofer)async{
    final Box<Chofer> box = await Hive.openBox<Chofer>('choferes');
    return box.add(chofer); 
  }

  

  Future<List<Chofer>> get choferesList async{
   final Box<Chofer> box = await Hive.openBox<Chofer>('choferes');
    return box.values.toList();
 
  }

  
}