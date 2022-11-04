// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


part 'hive_reporte_model.g.dart';


@HiveType(typeId: 3)
class ReporteModel extends HiveObject {
  @HiveField(0)
  final String autor;
  @HiveField(1)
  final String text;

  ReporteModel({required this.autor, required this.text});

}