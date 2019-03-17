
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;

void main() =>runApp(MApp());

class MApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Ubicación Actual"),
        backgroundColor: Colors.green,
      ),
      body: AppMaps(),
    );
  }
}

class AppMaps extends StatefulWidget {
  _AppMapsState createState() => _AppMapsState();
}

class _AppMapsState extends State<AppMaps> {

    GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
       child:  Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            options: GoogleMapOptions(
              trackCameraPosition: true,
              myLocationEnabled: true,
              cameraPosition: CameraPosition(
                target: LatLng(0.0, 0.0))
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese Referencias',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                  suffixIcon: IconButton(
                    icon: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: (){

                      },
                      iconSize: 30.0,
                    ), onPressed: () {},
                  ),                                
                ),
                onChanged: (val) {
                  setState(() {
                  });
                }
              ),
            ),
          ),
          Positioned(
            bottom: 100.0,
            right: 15.0,
            child:
            FloatingActionButton(
              onPressed: _onAddMarkerButtonPressed,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: Colors.green,
              child: const Icon(Icons.add_location, size: 36.0),
            ),
          ),
        ],
      ),
    );
  }

    void _onAddMarkerButtonPressed() {
      mapController.addMarker(
        MarkerOptions(
          position: LatLng(
            mapController.cameraPosition.target.latitude,
            mapController.cameraPosition.target.longitude,
          ),
          infoWindowText: InfoWindowText('Ubicación de Cancha', 'Here'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    refresh();
  }

    void refresh() async {
      final center = await getUserLocation();
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: center == null ? LatLng(0, 0) : center, zoom: 15.0)));
    }

    Future<LatLng> getUserLocation() async {
      var currentLocation = <String, double>{};
      final location = LocationManager.Location();
      try {
        currentLocation = await location.getLocation();
        final lat = currentLocation["latitude"];
        final lng = currentLocation["longitude"];
        final center = LatLng(lat, lng);
        return center;
      } on Exception {
        currentLocation = null;
        return null;
      }
  }
}