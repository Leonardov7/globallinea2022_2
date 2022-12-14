import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../DTO/UserObject.dart';

class Geo extends StatefulWidget {
  final UserObject userOb1;
  Geo(this.userOb1);
  GeoApp createState() => GeoApp();
}

class GeoApp extends State<Geo> {
  late Position position;
  TextEditingController local =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocalización '+widget.userOb1.nombre + ' Rol--> '+widget.userOb1.rol ),
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(
            onPressed: () async {
              local.text = (await _determinePosition()).toString();
              print(local.text);
            },
            icon: const Icon(Icons.add),
            // child: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Posición'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: local,
                  style: TextStyle(color: Colors.blueGrey),
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Coordenadas ',
                    hintText: 'Coordenadas',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
    } else {
      await Geolocator.openLocationSettings();
    }
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    print(await Geolocator.getCurrentPosition());

    return await Geolocator.getCurrentPosition();
  }
}
