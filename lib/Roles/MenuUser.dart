import 'package:flutter/material.dart';

import '../DTO/UserObject.dart';

class MenuUser extends StatefulWidget{
  final UserObject userOb1;
  MenuUser(this.userOb1);
  MenuUserApp createState() => MenuUserApp();
}
class MenuUserApp extends State<MenuUser>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola usuario '+widget.userOb1.nombre),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(),
    );
  }
}