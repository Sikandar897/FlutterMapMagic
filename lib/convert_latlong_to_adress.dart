import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class ConvertLatLongToAdress extends StatefulWidget {
  const ConvertLatLongToAdress({super.key});

  @override
  State<ConvertLatLongToAdress> createState() => _ConvertLatLongToAdressState();
}

class _ConvertLatLongToAdressState extends State<ConvertLatLongToAdress> {

  String stAdress= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: const Text('Google Map'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(stAdress),
          ),
          Center(
            child: GestureDetector(
              onTap: () async{
                final coordinates = Coordinates(33.6666, 73.0710 );
                var adress =await Geocoder.local.findAddressesFromCoordinates(coordinates);
                var first = adress.first;
                print("Adress:"+first.featureName.toString()+first.addressLine.toString());
                setState(() {
                  stAdress = "${first.addressLine}";
                });
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent, 
                  borderRadius: BorderRadius.all(Radius.circular(13))
                ),
                child: const Center(
                  child: Text('Convert', style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ), 
        ],
      ),
    );
  }
}