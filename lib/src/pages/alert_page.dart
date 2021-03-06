import 'dart:ffi';

import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina de alerta'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('mostrar alertas!!!'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () =>_mostrarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context){
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context){

          return AlertDialog(
            shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(10)),
            title: Text("Titulo de la alerta"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Contenido de la alerta en texto"),
                FlutterLogo(size: 100,)
              ],
            ),
            actions: <Widget>[
              FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text("cancelar")),
              FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text("aceptar"))
            ],
          );

        }
      );
  }
}