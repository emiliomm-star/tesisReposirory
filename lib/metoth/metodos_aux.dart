

// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:latlong2/latlong.dart';


class AuxMetoth {


 // ignore: non_constant_identifier_names
 List <double> SearchMinor(List<double> Lista ){

    
    List <double> minorPos = [];
    double minor = 999999999999999;
    for (var i = 0; i < Lista.length; i++) {
      if (Lista[i] < minor) {
        minor = Lista[i];
      }
      
    }
    minorPos.add(minor);
    minorPos.add(Lista.indexOf(minor).toDouble()); 
    return minorPos;
  }
 List<double> searchMajor(List<double> Lista ){

    
    List <double> latLong = [];
    double major = -999999999999999;
    for (var i = 0; i < Lista.length; i++) {
      if (Lista[i] > major) {
        major = Lista[i];
      }
    }
    latLong.add(major);
    latLong.add(Lista.indexOf(major).toDouble()); 
    return latLong;
  }


  List<String> latlngMakeString(List<LatLng> list){
    List<String> listAux = []; 
    for (var i = 0; i < list.length; i++) {
      listAux.add('${list[i].latitude},${list[i].longitude}');

      
    }
    return listAux;
  }

  

  

}