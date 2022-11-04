// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'hive_director_model.g.dart';


@HiveType(typeId: 1)
class DirectorModel extends HiveObject{
  @HiveField(0)
 final String name ;

  DirectorModel( {required this.name});
 
}