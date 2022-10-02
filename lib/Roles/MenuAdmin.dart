import 'package:flutter/material.dart';

import '../DTO/UserObject.dart';

class MenuAdmin extends StatefulWidget{
  final UserObject userOb1;
  MenuAdmin(this.userOb1);
  MenuAdminApp createState() => MenuAdminApp();
}
class MenuAdminApp extends State<MenuAdmin>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola '+widget.userOb1.nombre+ ' administrador'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(),
    );
  }
}