
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ultimateproject/models/hiveModels/hive_vehiculo_model.dart';

class VehiculoOperations extends HiveObject{
 VehiculoOperations();
  
   Future<int> saveVehiculo(VehiculoModel vehiculo)async{
    final Box<VehiculoModel> box = await Hive.openBox<VehiculoModel>('vehiculos');
    return box.add(vehiculo); 
  }

  

  Future<List<VehiculoModel>> get vehiculosList async{
   final Box<VehiculoModel> box = await Hive.openBox<VehiculoModel>('vehiculos');
    return box.values.toList();
 
  }

  
}