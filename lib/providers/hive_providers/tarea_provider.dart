
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ultimateproject/models/hiveModels/hive_tarea_model.dart';


class TareaOperations extends HiveObject{
 TareaOperations();
  
   Future<int> saveTarea(Tarea tarea)async{
    final Box<Tarea> box = await Hive.openBox<Tarea>('tareas');
    return box.add(tarea); 
  }

  

  Future<List<Tarea>> get tareasList async{
   final Box<Tarea> box = await Hive.openBox<Tarea>('tareas');
    return box.values.toList();
 
  }

  
}