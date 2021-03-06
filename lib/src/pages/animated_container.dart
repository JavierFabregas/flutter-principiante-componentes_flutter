import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget{
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage>{

  double _widht = 50;
  double _height = 50;
  Color _color = Colors.lightGreen;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated container, hace cosas"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration:Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          width: _widht,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarContenedor,

      ),
    );
  }

  void _cambiarContenedor(){

    final random = Random();

    setState(() {
      _widht = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(300).toDouble());

    });
  }
}