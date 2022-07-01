
import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
 
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  //CONTROLAR EL SCROLL 
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      //Calculando el final de la pagina
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
       // _agregar10();
       fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Component'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  _crearLista() {
    /* 
      RefreshIndicator sirve para refrescar la lista y debe envolver
      un widget que tenga un scroll
    */
    return RefreshIndicator(
      onRefresh: getPageOne,
      child: ListView.builder(
        controller: _scrollController, //ENLAZAMOS EL CONTROLADOR DEL SCROLL
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
    
          final imagen = _listaNumeros[index];
    
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/id/$imagen/500/300')
          );
        },
      ),
    );
  }

  Future<Null> getPageOne() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _lastItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _listaNumeros.add(_lastItem);
    }

    setState(() {});
  }
  Future fetchData() async{
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregar10();
  }

  _crearLoading() {
    if(_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    } else {
      return Container();
    }
  }
}
