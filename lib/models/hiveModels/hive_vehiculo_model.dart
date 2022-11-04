// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hive_vehiculo_model.g.dart';



@HiveType(typeId: 2)
class VehiculoModel extends HiveObject{
  @HiveField(0)
  final String chapa;

  VehiculoModel({required this.chapa});
  
}