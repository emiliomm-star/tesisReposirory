

import 'package:hive_flutter/hive_flutter.dart';

part 'hive_tarea_model.g.dart';


@HiveType(typeId: 4)
class Tarea extends HiveObject{
  @HiveField(0)
  late String name ;
  @HiveField(1)
  late String zona;

  Tarea({required this.name, required this.zona});
} 