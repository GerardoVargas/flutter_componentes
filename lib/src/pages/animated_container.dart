import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.00;
  double _height = 50.00;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _randomValues(),
        child: Icon(Icons.repeat_on_outlined),
      ),
    );
  }

  void _randomValues() {
      final random = Random();

      setState(() {
        _width = random.nextInt(250).toDouble();
        _height = random.nextInt(250).toDouble();

        _color = Color.fromRGBO(
          random.nextInt(255), 
          random.nextInt(255), 
          random.nextInt(255), 
          1
        );

        _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      });  
  }

}