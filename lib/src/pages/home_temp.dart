import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{

  final opciones = ['Uno','Dos','Tres','Cuatro','Rojo','Azul','Verde','Patatas','Macarrones','Lentejas'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearItems (){

    List<Widget> lista = new List<Widget>();

    for(String opt in opciones){
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista.add(tempWidget);
      lista.add(Divider());
        //dos formas de añadir
      lista..add(tempWidget)
           ..add(Divider());

    }

    return lista;

  }
  List<Widget> _crearItemsCorta() {
    return opciones.map((item){

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item+'!'),
            subtitle: Text('otro texto debajo'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.keyboard_arrow_right),

          ),
          Divider()
        ],
      );

    }).toList();

}

}