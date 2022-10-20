import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Prediction extends StatefulWidget {
  //final String location;
  //REST(this.location);
  @override
  PredictionApp createState() => PredictionApp();
}

class PredictionApp extends State<Prediction> {
  TextEditingController id = TextEditingController();
  TextEditingController temperatura = TextEditingController();
  TextEditingController altitud = TextEditingController();
  TextEditingController humedad = TextEditingController();
  //String location = '0,-0';
 // String localizacion='';
  String _location='';
  var dataHttp = '';

  consumirGet(Position location) async {
    print (location);
    try {
      //String localizacion =   _determinePosition().toString();

      List<String> coordenadas =  location.toString().split(',');
      print('1 '+  coordenadas.toString());
      //print(coordenadas[1]);
      List<String> _coordenadasLat = coordenadas[0].split(': ');
      List<String> _coordenadasLon = coordenadas[1].split(': ');

     double latitud = double.parse(_coordenadasLat[1]);
      double longitud = double.parse(_coordenadasLon[1]);
    _location = (latitud.toString() + ',' + longitud.toString());
     // print('latitud-----' + latitud.toString() + ' longitud----' + longitud.toString());
    }
    catch(e){print('ERROR Locali------'+e.toString());}
    try {
     // print('localizacion-----'+location);
      Response response =
          //await get(Uri.parse('https://jsonplaceholder.typicode.com/users/' + id));
          //http://api.weatherunlocked.com/api/current/4.917,%20-74.1?app_id=02546387&app_key=3ba0a43c2bc6266199961c600f7e5fa8
       await get(Uri.parse('http://api.weatherunlocked.com/api/forecast/'+_location+'?app_id=02546387&app_key=3ba0a43c2bc6266199961c600f7e5fa8'));
          //await get(Uri.parse('http://api.weatherunlocked.com/api/current/'+_location+'?app_id=02546387&app_key=3ba0a43c2bc6266199961c600f7e5fa8'));
      Map data = jsonDecode(response.body);
      //print('NAME: ${data['name']} /// username: ${data['username']}');
      // print(data);
      print(response.statusCode.toString() + " Código de respuesta");
      if (response.statusCode.toString() == '200') {
        temperatura.text = '${data['temp_c']} C°';
        altitud.text = '${data['alt_m']} mts';
        humedad.text = '${data['humid_pct']} %';
        print('6 ${data['Days'][0]['date']}');
       // print('7 ${data['Days'][0]['sunrise_time']}');
       // print('8 ${data['Days'][0]}');
        print('9 ${data['Days'][0]['Timeframes']}');
        print('10 ${data['Days'][0]['Timeframes'][2]['time']}');
        print('Probabilidad Precipitación  --> ${data['Days'][0]['Timeframes'][0]['prob_precip_pct']}');



        // correo.text='${data['email']}';
        // username.text='${data['username']}';

      }
    } catch (e) {
      print('ERROR.........'+e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado actual del clima'),
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(500, 50), backgroundColor: Colors.black45,
                  ),
                  onPressed: () async {
                    print(await _determinePosition());
                    Position localizacion=   await _determinePosition();
                   //print(await localizacion+' 2');
                    await consumirGet(localizacion);

                  },
                  child: Text('Predicción climática'),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  enabled: false,
                  controller: temperatura,
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Temperatura',
                    hintText: 'Temperatura',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  enabled: false,
                  controller: altitud,
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Altitud',
                    hintText: 'Altitud',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  enabled: false,
                  controller: humedad,
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Humedad',
                    hintText: 'Humedad',
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10), child: Text("Data " + dataHttp))
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
