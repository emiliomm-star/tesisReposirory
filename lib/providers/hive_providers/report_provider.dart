import 'package:hive_flutter/hive_flutter.dart';
import 'package:ultimateproject/models/hiveModels/hive_reporte_model.dart';

class ReportProvider extends HiveObject{
  ReportProvider();

  Future<int> saveReport(ReporteModel report)async{
    final Box<ReporteModel> box = await Hive.openBox<ReporteModel>('reportes');
    return box.add(report); 
  }

  

  Future<List<ReporteModel>> get reportesList async{
   final Box<ReporteModel> box = await Hive.openBox<ReporteModel>('reportes');
    return box.values.toList();
 
  }
}