import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Component'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

Widget _cardTipo1() {
  return Card(
    elevation: 10.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue,),
          title: Text('Ejemplo del titulo de la tarjeta'),
          subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              onPressed: (){}, 
              child: Text('Cancelar')
            ),
            TextButton(
              onPressed: (){}, 
              child: Text('Ok')
            ),
          ],
        )
      ],
    ),
  );
}

Widget _cardTipo2() {
  final card = Container(
    //AÑADIENDO IMAGENES A LAS TARJETAS
    child: Column(
      children: <Widget>[
        /* 
          FadeInImage es un Widget que nos permite colocar un loader image,
          de ese modo el UX es mas acertivo.
        */
        FadeInImage(
          image: NetworkImage('https://pixelsandwanderlust.com/wp-content/uploads/2020/05/forest-landscape-photography-scaled.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'), 
          fadeInDuration: Duration(
            milliseconds: 200
          ),
          height: 250.0,
          fit: BoxFit.cover,
        ),
        /* Image(
          image: NetworkImage('https://pixelsandwanderlust.com/wp-content/uploads/2020/05/forest-landscape-photography-scaled.jpg'),
        ), */
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('El bosque encantado')
        ),
      ],
    ),
  );

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(2.0, 5.0),
        )
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}