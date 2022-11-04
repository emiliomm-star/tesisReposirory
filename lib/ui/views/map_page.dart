
// @dart=2.9

// ignore_for_file: unused_import, prefer_const_constructors, avoid_print, non_constant_identifier_names, avoid_unnecessary_containers, unused_local_variable, unused_element, unnecessary_brace_in_string_interps, prefer_adjacent_string_concatenation

import 'dart:convert';
import 'dart:html';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/plugin_api.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:mapbox_directions/mapbox_directions.dart';
import 'package:provider/provider.dart';
import 'package:ultimateproject/models/quicktype_models/mapbox_model_quicktype.dart';


import '../../metoth/metodos_aux.dart';
import '../../models/quicktype_models/polilines_provider.dart';
import '../../services/puntos.dart';





class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

MapController mapController = MapController();
 
LatLng _currentPosition = LatLng(0, 0);

//late LocationData _currentPosition;
//Location location = Location();


List<LatLng> points = [] ; 
List<LatLng> becomedCoordinates = [] ;
List<LatLng> ultimate = [];
List<LatLng> asd = [];
List<LatLng> ultimateGetRoute = [];



List<Marker> markers = [];

List<CircleMarker> circles = [];



Puntos aux = Puntos(listaPuntos: []);
AuxMetoth metoths = AuxMetoth();




var url = Uri.parse('https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf6248044385c88d0c461fbd9bf2fb1556f6dd&start=8.681495,49.41461&end=8.687872,49.420318');

 @override
  void initState() {
    super.initState();
  //_ReturnDistance();  
  
  
    

    
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  
 
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UCI-MAP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        
        body: FlutterMap(
          
          mapController: mapController,
          options: MapOptions(
            center: LatLng(22.98793822432008, -82.46575411243194),
            onLongPress: (value,cordinate) {
              aux.AddPunto(cordinate);
              print(cordinate);
             points = aux.listaPuntos ;    // puntos latlng en la lista points
              setState(() {
                circles.add(CircleMarker(point: cordinate, radius: 2, color: Colors.black));
              });

            },
          zoom: 16.0,
          
          ),
          
          
        
          children: [
            
            
            TileLayer(
              urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/"
                     "{z}/{x}/{y}?access_token=pk.eyJ1IjoidW5kZXJ0YWtlcnIiLCJhIjoiY2wyZGR6MXRsMGpxMTNic2FkcnI2aDN4OSJ9.n3Yn4OxeMxTR0_eRaw6-LA",
                    // tileBounds: LatLngBounds.fromPoints(bounds),
                  ),
                     
            MarkerLayer(
              markers: markers,
            ),
               
                  
                  
              
            CircleLayer(
              circles: circles,
            ),

            PolylineLayer(
              polylines: [
                new Polyline(
                  points: ultimate,
                  color: Colors.black,
                  strokeWidth: 5
                  )
              ],
            )

            ],
            
            
          ),
        
       floatingActionButton: Column(    // Boton locacion
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           FloatingActionButton(
        child: Icon(Icons.location_on),
        onPressed: ()async{

         await _getCurrentLocation();
          print('Location ');


         // await _getCurrentLocation();
          
          setState(() {
            markers.add(_AsignedMarker());
            mapController.move(
              LatLng(_currentPosition.latitude, _currentPosition.longitude) , 
              10,
              
              );
          });
        }
        ),

        SizedBox(height: 5,),

          FloatingActionButton(     // Boton basura
            child: FaIcon(FontAwesomeIcons.trash),
            onPressed: (){
             // print(aux.listaPuntos);
              setState(() {
                
                for (var i = 0; i < points.length; i++) {
                markers.add(Marker(
                  width: 30,
                  height: 30,
                  point: points.elementAt(i), 
                  builder: (context) => FaIcon(FontAwesomeIcons.solidTrashCan)
                  ));
              }
              points.add(LatLng(_currentPosition.latitude, _currentPosition.longitude));

              });
              print(points);
              //print(getCoordiantes_withLocation());
              }
            
            ),

                    SizedBox(height: 5,),

                    FloatingActionButton(
                      onPressed: () async{
                        
                  /*    var url = Uri.https('api.mapbox.com/directions/v5/mapbox', 'driving/-82.463662%2C22.989493%3B-82.46568%2C22.990166%3B-82.46331%2C22.990569%3B-82.465004%2C22.992193%3B-82.46276%2C22.991559',{
                        'alternatives' : 'true',
                        'annotations'  : 'distance%2Cduration',
                        'geometries'   : 'polyline6',
                        'overview'     : 'full',
                        'steps'        : 'true',
                        'access_token' : 'pk.eyJ1IjoidW5kZXJ0YWtlcnIiLCJhIjoiY2wyZGR6MXRsMGpxMTNic2FkcnI2aDN4OSJ9.n3Yn4OxeMxTR0_eRaw6-LA',

  });

  final response = await http.get(url);
  final decodedData = json.decode(response.body);
  final mapboxModel = MapboxModel.fromJson(decodedData as Map<String , dynamic>);
  
  if (response.statusCode != 200) {
    print('error'); 
  }

  print('Puntos mapbox' + mapboxModel.routes.first.legs.first.steps.first.intersections.first.location.toString());
   */                     
                        
                        List<LatLng> copylist = points;
                      
                        List<double> distancePoints = [];

                        List<int> visits = [];

                        List result = [];
                        
                        ultimate.add(copylist[0]);
                        
                        var distance = DistanceHaversine();

                        for (var i = 0; i < points.length; i++) {
                          if ( !visits.contains(points.indexOf(points[i]))) {

                            for (var j = 0; j    < copylist.length   ;   j++) {

                              if (distance   .as(LengthUnit.Meter, LatLng(points[i].latitude, points[i].longitude), LatLng(copylist[j].latitude, copylist[j].longitude)) == 0) {
                                print('Calculando distancia de puntos iguales');
                                
                              } else {
                                 
                             distancePoints.add(distance.as(LengthUnit.Meter, LatLng(points[i].latitude, points[i].longitude), LatLng(copylist[j].latitude, copylist[j].longitude)) );
                             print('Calculando distancia entre ${LatLng(points[i].latitude, points[i].longitude)} y el valor ${LatLng(copylist[j].latitude, copylist[j].longitude)}');
                            // var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(LatLng(points[i].latitude, points[i].longitude), LatLng(copylist[j].latitude, copylist[j].longitude));
                              print(distancePoints.toList()); // distancia en metros
                               result = metoths.SearchMinor(distancePoints);
                             print(result.toList()); // elemento - posicion
                              }
                       
                          }
                           visits.add(result[1]+1);
                           print(visits.toList());

                          if(!ultimate.contains((points[result[1]]))){
                             ultimate.add(points[result[1]]);
                          }
                         
                         ultimate.add(points[result[1]+1]);
                          
                          print('Lista definitiva : \n ${ultimate.toList()}');
                            

                          //copylist.removeAt(result[1]);
                          //print(copylist.toList());

                          i = points.indexOf(points[result[i]+1]);
                          while (result.isNotEmpty) {
                            result.remove(result.first);
                          }
                        //  print(result);

                          }
                          else{
                            print('Este punto ya ha sido visitado');

                          }
                          

                

                      
                          
                          
                          /*
                          print('Primer punto de ultimate  ${ultimate[i].latitude.toString()},${ultimate[i].longitude.toString()}');
                          print(' Segundo punto de ultimate  ${ultimate[i+1].latitude.toString()},${ultimate[i+1].longitude.toString()}');

                         for (var i = 0; i < ultimate.length; i++) {


                            var url = Uri.https('api.openrouteservice.org','v2/directions/driving-car',{

                              

                              'api_key' : '5b3ce3597851110001cf6248044385c88d0c461fbd9bf2fb1556f6dd',
                              'start'   : '${ultimate[i].latitudeInRad.toString()},${ultimate[i].longitude.toString()}',
                              'end'     : '${ultimate[i+1].latitude.toString()},${ultimate[i+1].longitude.toString()}',

                          });

                                       final response = await http.get(url);
                            final decodedData = json.decode(response.body);
                            final polylinePoints = PolilinesProvider.fromJson(decodedData as Map<String , dynamic>);
                            var cordinates = polylinePoints.features.first.geometry!.coordinates;
                             if (response.statusCode != 200) {
                               print('error');
                             } else {
                              for (var i = 0; i < cordinates.length; i++) {
                                
                              }
                               print(polylinePoints.features.first.geometry!.coordinates.toList());
                               
                             }
                          }

                               */
                        }
                     //  await getPointsRoute();
                              

                      }
                      , 
                    child: Icon(Icons.arrow_upward),),
     
                   ],
                 ),
          
        
      ),

      
      
    );
   
  }

        /*    Future<List<double>> getPointsRoute()async{
                          
                          
                         MBRoute().setApiToken('pk.eyJ1IjoidW5kZXJ0YWtlcnIiLCJhIjoiY2wyZGR6MXRsMGpxMTNic2FkcnI2aDN4OSJ9.n3Yn4OxeMxTR0_eRaw6-LA');
                        MBResponse respuesta =  await MBRoute().getRouteTo(ultimate,MBProfile.DRIVING);
                        final mapboxModel = MapboxModel.fromJson(respuesta as Map<String , dynamic>);

                        print(mapboxModel.routes[0].legs[0].steps[0].intersections[0].location.toList());
                              return mapboxModel.routes[0].legs[0].steps[0].intersections[0].location.toList();
                          }*/

 

  Future<void> _getCurrentLocation() async {
    await Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
      .then((Position position) {
        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
          
        });
      }).catchError((e) {
        print(e);
      });
  }

 Marker _AsignedMarker() {
  return Marker(
                  point: LatLng(_currentPosition.latitude, _currentPosition.longitude), 
                  builder: (context) => Container(
                    child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.red,
                      iconSize: 45,
                      onPressed: (){
                        
                      },
                      ),
                  )
                  );

 }
  
  List<LatLng> getCoordiantes_withLocation(){
    
    becomedCoordinates.add(LatLng(_currentPosition.latitude, _currentPosition.longitude)) ;

    for (var i = 0; i < points.length; i++) {
      becomedCoordinates.add(LatLng(points[i].latitude, points[i].longitude));
    }

   print('current location is - ' + '${_currentPosition.latitude}, ${_currentPosition.longitude}' + ' new points =>: ${becomedCoordinates}');
          return becomedCoordinates ;  
  }
  
 /*  Future <void> getActualLocation() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
  //  _initialcameraposition = LatLng(_currentPosition.latitude,_currentPosition.longitude);
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.longitude}");
      setState(() {
        _currentPosition = currentLocation;

      //  _initialcameraposition = LatLng(_currentPosition.latitude,_currentPosition.longitude);
      });
    });
   }*/
  }