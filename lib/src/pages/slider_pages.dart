import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  bool _checkBlock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Component'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged:  (_checkBlock ) ? null : (valor) {
        print(valor);
        setState(() {
          _sliderValue = valor;
        });
      }
    );
  }

  _crearImagen() {
    return Image(
      image: NetworkImage('http://pngimg.com/uploads/batman/batman_PNG52.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  _crearCheckbox() {

    //CheckBox normal
    /* return Checkbox(
      value: _checkBlock, 
      onChanged: (value) {
       if(value != null) {
         setState(() {
           _checkBlock = value;
         });
       }
      }
    ); */

    //Checkbox mas estetico
    return CheckboxListTile(
      value: _checkBlock, 
      onChanged: (value) {
       if(value != null) {
         setState(() {
           _checkBlock = value;
         });
       }
      },
      title: Text('Bloquear Slider'),
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      value: _checkBlock, 
      onChanged: (value) {
       if(value != null) {
         setState(() {
           _checkBlock = value;
         });
       }
      },
      title: Text('Bloquear Slider'),
    );
  }
}