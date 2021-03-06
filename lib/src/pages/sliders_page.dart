import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget{
  @override
  _SliderPageState createState() => _SliderPageState();

}

class _SliderPageState extends State<SliderPage>{

  double _valorSlider = 300;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sliders'),
        ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
                child:_crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider(){

    return Slider(
      activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        value: _valorSlider,
        min: 10,
        max: 400,
        onChanged: (_bloquearCheck) ? null : (valor){
          //print(valor);
          setState(() {
            _valorSlider = valor;
          });
        }
    );
  }

  Widget _crearImagen(){

    return FadeInImage(
      image: NetworkImage('https://trucoslondres.com/wp-content/uploads/2017/05/playa.jpg'),
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {

    return CheckboxListTile(
      title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
        });
    }

  Widget _crearSwitch(){

    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
        }
        );
  }


}

