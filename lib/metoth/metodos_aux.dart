

// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:latlong2/latlong.dart';


class AuxMetoth {


 // ignore: non_constant_identifier_names
 List <double> SearchMinor(List<List> Lista ){

    
    List <double> minorPos = [];
    double minor = 999999999999999;
    double pos = 0;
    for (var i = 0; i < Lista.length; i++) {
      if (Lista[i].first < minor) {
        minor = Lista[i].first;
        pos = Lista[i].last;
      }
      
    }
    minorPos.add(minor);
    minorPos.add(pos); 
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
      listAux.add('${list[i].latitude.toString()},${list[i].longitude.toString()}');
    }
    return listAux;
  }

  List<LatLng> listListToListLatLng(List<List<double>> listOfList){
     // List<double> listResultante      = [];
      List<LatLng> listResultanteFinal = [];
       for (var i = 0; i < listOfList.length; i++) {
        listResultanteFinal.add(LatLng(listOfList[i].last,listOfList[i].first));
        //  listResultanteFinal[i].latitude = listOfList[i].first;
        //  listResultanteFinal[i].longitude = listOfList[i].last;

        
       }
       return listResultanteFinal;
       
  }

  

  

}