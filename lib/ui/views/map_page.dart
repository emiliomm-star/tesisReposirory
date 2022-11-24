

// ignore_for_file: unused_import, prefer_const_constructors, avoid_print, non_constant_identifier_names, avoid_unnecessary_containers, unused_local_variable, unused_element, unnecessary_brace_in_string_interps, prefer_adjacent_string_concatenation

import 'dart:convert';
//import 'dart:html';


import 'package:dijkstra/dijkstra.dart';
//import 'package:directed_graph/directed_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/plugin_api.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
//import 'package:mapbox_directions/mapbox_directions.dart';
import 'package:provider/provider.dart';


import '../../metoth/metodos_aux.dart';
import '../../metoth/metodos_aux.dart';
import '../../metoth/metodos_aux.dart';
import '../../models/quicktype_models/polilines_provider.dart';
import '../../services/puntos.dart';





class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

MapController mapController = MapController();
 
LatLng _currentPosition = LatLng(0, 0);
LatLng nodoFinal = LatLng(0, 0);

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

var distance = DistanceHaversine();






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
                 Polyline(
                  points: ultimateGetRoute,
                  color: Colors.blue,
                  strokeWidth: 5
                  ),
                  //Polyline(points: points)
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
              16.0,
              
              
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


              // Codigo de prueba de grafos

              

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
                      
                        List<List> distancePoints = [];

                        List<int> visits = [];

                        List resultDistances = [];
                        
                        ultimate.add(copylist[0]);
                         
                        
                       

                        for (var i = 0; i < points.length; i++) {
                        

                            for (var j = 0; j < copylist.length; j++) {

                              if (distance.as(LengthUnit.Meter, LatLng(points[i].latitude, points[i].longitude), LatLng(copylist[j].latitude, copylist[j].longitude)) == 0) {
                                print('Calculando distancia de puntos iguales');
                                if (!visits.contains(points.indexOf(points[i]))) {
                                visits.add(points.indexOf(points[i]));
                               }
                              } 

                             else if (visits.contains(copylist.indexOf(copylist[j]))) {
                                print('Este punto ha sido visitado en copylist');
                              } 
                              else{
                                /*Garegar a distancePonits la lista de las distancias entre el valor fijo actual 
                                de i y el valor volatil de j ademas de agregar las posiciones de los elementos 
                                en copylist a medida q se van encontrando */
                             distancePoints.add([distance.as(LengthUnit.Meter, LatLng(points[i].latitude, points[i].longitude), LatLng(copylist[j].latitude, copylist[j].longitude)), 
                             points.indexOf(LatLng(copylist[j].latitude, copylist[j].longitude)) ]
                             );
                            
                             print('Calculando distancia entre ${LatLng(points[i].latitude, points[i].longitude)} y el valor ${LatLng(copylist[j].latitude, copylist[j].longitude)}');
                            // var distanceBetweenPoints = SphericalUtil.computeDistanceBetween(LatLng(points[i].latitude, points[i].longitude), LatLng(copylist[j].latitude, copylist[j].longitude));
                             print(distancePoints.toList()); // distancia en metros
                               resultDistances = metoths.SearchMinor(distancePoints);
                             print(resultDistances.toList()); // elemento - posicion
                              }
                              
                            
                              
                       
                          }
                          
                           visits.add(points.indexOf(points[resultDistances[1]]));
                           print(visits.toList());
 
                           ultimate.add(points[resultDistances[1]]);
                          
                           print('Lista definitiva : \n ${ultimate.toList()}');
                         
                           print(copylist.toList());

                           i = points.indexOf(points[resultDistances[1]])-1;
                           while (resultDistances.isNotEmpty) {
                            resultDistances.remove(resultDistances.first);
                            }
                            while (distancePoints.isNotEmpty) {
                            distancePoints.remove(distancePoints.first);
                            }
                           print(distancePoints);

                           print('Lista definitiva del algoritmo: \n ${ultimate.toList()}');

                           print(metoths.latlngMakeString(ultimate).toList());

                           if (visits.length == points.length) {
                             break;
                           }
  
                        }


                    
  
                      }
                      , 
                    child: Icon(Icons.merge_type),),

                    SizedBox(height: 5,),

                    FloatingActionButton(
                      onPressed: ()async{

                        List<String> puntosStrings = [];

                        //'${ultimate[0].latitude},${ultimate[0].longitude}', '${ultimate[1].latitude},${ultimate[1].longitude}', '${ultimate[2].latitude},${ultimate[2].longitude}', '${ultimate[3].latitude},${ultimate[3].longitude}', '${ultimate[4].latitude},${ultimate[4].longitude}'

                       

                          var url = Uri.https('graphhopper.com', 'api/1/route',{
                                  'key'            : '94e8d176-888f-48c0-9248-3381ce17ee57',
                                  'point'          :  metoths.latlngMakeString(ultimate),          //['-51.131,12.414', '48.224,3.867'],
                                 // 'algorithm'      :  'alternative_route',
                                  'profile'        : 'car',
                                  'locale'         : 'de',
                                 // 'calc_points'    : true,
                                  'points_encoded' : 'false',
                                  'optimize'       : 'true'

                          });

                          final response = await http.get(url);
                          final decodedData = await json.decode(response.body);
                          final polylinesPoints =  PolilinesProvider.fromJson(decodedData as Map<String , dynamic>);

                          if (response.statusCode != 200) {
                             print('error'); 
                           }
                            
                            print('Lista proveedora de puntos para polylines : \n'  +  '${polylinesPoints.paths.first.points!.coordinates.toList()}');

                            List<List<double>> listListaAux = polylinesPoints.paths.first.points!.coordinates.toList();

                           // print('Lista proveedora de puntos para polylines convertida a LatLng: \n'  +  '${metoths.listListToListLatLng(listListaAux)}');

                            
                            

                       /* Map<String, dynamic> payload = 
                        {
                        "coordinates" : [[8.681495,49.41461],[8.686507,49.41943],[8.687872,49.420318]]
                      };
                        
                     var url = Uri.parse('https://api.openrouteservice.org/v2/directions/driving-car')   ;
                     var response = await http.post(
                      url,
                      headers: {
                        "Authorization" : "5b3ce3597851110001cf6248044385c88d0c461fbd9bf2fb1556f6dd",
                        'Content-Type'  : 'application/json'
                      },
                      body: jsonEncode(payload)
                      );

                      if (response.statusCode == 200) {
                       var jsonResponse = await json.decode(response.body);
                        print(jsonResponse);
                      }
                      else{
                        print('Algo salio mal');
                      }*/
                          setState(() {
                            ultimateGetRoute.add(points[0]);
                            ultimateGetRoute = metoths.listListToListLatLng(listListaAux);
                            
                          print(ultimateGetRoute);
                          });
                          
                      },
                      child: Icon(Icons.show_chart),
                      ),
     
                   ],
                 ),
          
        
      ),

      
      
    );
   
  }

         /*   Future<List<double>> getPointsRoute()async{
                          
                          
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