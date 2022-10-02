import 'package:flutter/material.dart';

import '../DTO/UserObject.dart';

class MenuUser extends StatefulWidget {
  final UserObject userOb1;
  MenuUser(this.userOb1);
  MenuUserApp createState() => MenuUserApp();
}

class MenuUserApp extends State<MenuUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola usuario ' + widget.userOb1.nombre),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 40, right: 10, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, minimumSize: Size(400, 50)),
                onPressed: () {},
                child: Text(
                  'Localización',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, minimumSize: Size(400, 50)),
                onPressed: () {},
                child: Text(
                  'Predicción del clima',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, minimumSize: Size(400, 50)),
                onPressed: () {},
                child: Text(
                  'Posición Geográfica',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, minimumSize: Size(400, 50)),
                onPressed: () {},
                child: Text(
                  'Gestíon de usuario',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
