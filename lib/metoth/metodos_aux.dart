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
}