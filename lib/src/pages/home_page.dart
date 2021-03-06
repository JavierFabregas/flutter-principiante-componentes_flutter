

import 'package:flutter/material.dart';
import 'package:flutter_app_componentes/src/pages/alert_page.dart';
import 'package:flutter_app_componentes/src/providers/menu_provider.dart';
import 'package:flutter_app_componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba componentes flutter'),
      ),
      body: _list(),
    );
  }


  Widget _list(){

    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){


          return ListView(
            children: _listaItems(snapshot.data, context),
          );

      },
    );

  }

  List<Widget> _listaItems( List<dynamic> data , BuildContext context){
    final List<Widget> opciones = [];

    for (var opt in data){
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){
          /* Forma simple de navegacion
          final route = MaterialPageRoute(
              builder: (context){
                return AlertPage();
              }
          );
          Navigator.push(context, route);
          */

          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      opciones..add(widgetTemp)
              ..add(Divider());
    }
    return opciones;
  }




}