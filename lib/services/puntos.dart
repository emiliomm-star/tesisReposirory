// ignore_for_file: non_constant_identifier_names


import 'package:latlong2/latlong.dart';
class Puntos {

 List<LatLng> listaPuntos = [];

  Puntos({required this.listaPuntos});

  List<LatLng> AddPunto(LatLng punto){
    listaPuntos.add(punto);
    return  listaPuntos;
  }

 List<LatLng> get GetPoints => listaPuntos;
}