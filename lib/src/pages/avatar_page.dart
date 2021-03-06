import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina de avatar'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text("JF"),
              backgroundColor: Colors.lightGreen,
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://www.kindpng.com/picc/m/24-248729_stockvader-predicted-adig-user-profile-image-png-transparent.png'),
              radius: 25,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://img.blogs.es/anexom/wp-content/uploads/2018/12/42707058715_61bbdc578f_k.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 100),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }


}