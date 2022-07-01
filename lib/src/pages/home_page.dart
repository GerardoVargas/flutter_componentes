import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
//import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    /* 
      Un future tiene varios estados:
      - Cuando se esta pidiendo información
      - Cuando se resuelve
      - Cuando da un error
     */
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], // Info por defecto que tendra por si no se ha resuelto
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        
      //print('Builder >>> $snapshot.data');

      return ListView(
        // SETEAMOS EL CONTEXT QUE DEFINIMOS ARRIBA EN EL BUILDER
        children: _listaItems( snapshot.data, context ),
      );

      },
    );



    //print(menuProvider.opciones);
   /*  menuProvider.cargarData().then((opciones) {
      print('Opciones >>> $opciones');
    }); */

    

   /*  return ListView(
      children: _crearListaItems(),
    ); */
  }


  // AGREGAMOS UN ARGUMENTO CONTEXT EL CUAL RECIBIRA EL CONTEXT GENERAL DE LA APP
  List<Widget> _listaItems( List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];
    data?.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){

          Navigator.pushNamed(context, element['ruta']);

          /*
            Para navegar a otra vista, usamos el metodo Navigator, el cual recibe un context y un route.
            El context como ya ha sido declarado solo es cuestion de irlo pasando (ver anotaciones de arriba) 
           */

         /*  final route = MaterialPageRoute(
            builder: (context) => AlertPage()
          );
          Navigator.push(context, route); //Navegar a paginas que queramos pero solo a una estatica */
        },
      );

      opciones..add(widgetTemp)
              ..add(Divider());
    });

    return opciones;

   /*  return [
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo'))
    ]; */
  }
}