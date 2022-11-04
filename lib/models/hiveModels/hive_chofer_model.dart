// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hive_chofer_model.g.dart';

@HiveType(typeId: 0)
class Chofer extends HiveObject{
  @HiveField(0)
  final String ci;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String job;

  Chofer( {required this.ci, required this.name, required this.job} );

}