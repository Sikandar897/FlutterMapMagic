import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  // ignore: prefer_const_declarations
  static final CameraPosition _kgooglePlex = const CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 13,
  );

  final List<Marker> _marker = [];
  //adding marker on map of this langitute and latitude
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6361, 72.9789),
        infoWindow: InfoWindow(title: 'My Current Location')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(33.7182, 73.0714),
        infoWindow: InfoWindow(title: 'Blue Area')),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(33.6666, 73.0710),
        infoWindow: InfoWindow(title: 'Sector I8'))
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
            markers: Set<Marker>.of(_marker),
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
            initialCameraPosition: _kgooglePlex),
      ),
    );
  }
}
