import 'package:flutter/material.dart';

class InputPage extends StatefulWidget{
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>{

  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";
  List<String> _listaDropDown = ['Elemento 1','Elemento 2','Elemento 3','Elemento 4','Elemento 5','Elemento 6','Elemento 7','Elemento 8'];
  String _opcionSeleccionada = 'Elemento 1';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina de inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        children: <Widget>[
          Divider(),
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

 Widget _crearInput() {
   return TextField(
     autofocus: true,
     textCapitalization: TextCapitalization.sentences,
     decoration: InputDecoration(
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(15)
       ),
       counter: Text('Letras ${_nombre.length}'),
       hintText: "Nombre de la persona",
       labelText: "Nombre",
       helperText: 'Nombre con apellidos.',
       suffixIcon: Icon(Icons.accessibility),
       icon: Icon(Icons.account_circle)
     ),
     onChanged: (valor){
       setState(() {
         _nombre = valor;
         print(_nombre);
       });
     },
   );
 }


 Widget _crearPersona(){
    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
 }

  Widget _crearEmail(){
   return TextField(
     keyboardType: TextInputType.emailAddress,
     decoration: InputDecoration(
         border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15)
         ),
         hintText: "Example@vanadis.es",
         suffixIcon: Icon(Icons.alternate_email),
         icon: Icon(Icons.email)
     ),
     onChanged: (valor){
       setState(() {
         _email = valor;
       });
     },
   );
 }

  Widget _crearPassword (){
   return TextField(
     obscureText: true,
     decoration: InputDecoration(
         border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15)
         ),
         hintText: "Contraseña",
         suffixIcon: Icon(Icons.lock_open),
         icon: Icon(Icons.lock)
     ),
     onChanged: (valor){
       setState(() {
         _password = valor;
         print(_password);
       });
     },
   );
 }

  Widget _crearFecha (context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          hintText: "Fecha de nacimiento",
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );
  }

  _selectDate(BuildContext context) async{

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es','ES')
    );

    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista = new List();

    for(String elemento in _listaDropDown){
        lista.add(DropdownMenuItem(
            child: Text(elemento),
            value: elemento,
        ));
    }

    return lista;
  }

  Widget _crearDropDown(){


    return Row (
      children: <Widget>[
        Icon(Icons.add_comment),
        SizedBox(width: 30),
        Expanded(child:
          DropdownButton(
            items: getOpcionesDropdown(),
            value: _opcionSeleccionada,
            onChanged: (opt){

              setState(() {
                _opcionSeleccionada = opt;
              });

            },
          ),
        ),
      ],
    );






  }



}