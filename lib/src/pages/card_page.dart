import 'package:flutter/material.dart';

class CardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(40),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30,),
          _cardTipo2()
        ],
      ),
    );
    
  }

  Widget _cardTipo1() {

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text("sñljañlkdfngba dgdsf sdfhg d-zklfjbñalksdfjgs dfdfkañsldkgjfñalskdnv "),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){},
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: (){},
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {


    final card = Container(
      //clipBehavior: Clip.antiAlias,

      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://pro2-bar-s3-cdn-cf2.myportfolio.com/f7b51595-7701-42b3-a966-bb0e4baf04df/d0a01d8f-0d02-4847-b081-52e0032d1362_rw_1920.jpg?h=c0b64791dd9578e3cc981888f49a0e19'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250,
            fit: BoxFit.cover,
          ),
          Image(
            image: NetworkImage('https://pro2-bar-s3-cdn-cf2.myportfolio.com/f7b51595-7701-42b3-a966-bb0e4baf04df/d0a01d8f-0d02-4847-b081-52e0032d1362_rw_1920.jpg?h=c0b64791dd9578e3cc981888f49a0e19'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('texto de la imagen'),

          ),
        ],
      ),
    );

    //Simulacion de tarjeta
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
          child: card,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(2, 10)
          )
        ],
      ),
    );
  }
  
  
}