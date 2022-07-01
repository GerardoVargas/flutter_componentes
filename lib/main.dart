import 'package:flutter/material.dart';

import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
       localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
      //home: HomePage()
      initialRoute: '/',
      /* 
        En caso de que sean pocas rutas, es aceptable dejar los routes en el main.
        En caso de ser varias rutas es conveniente crear un archivo routes.dart

        routes: <String, WidgetBuilder> {
        '/' : (BuildContext context) => HomePage(),
        'alert' : (BuildContext context) => AlertPage(),
        'avatar' : (BuildContext context) => AvatarPage(),
      },
       */

      routes: getApplication(),
      /* 
        Podemos dar un compotamiento por defecto en caso de que una ruta
        no se encuentre y asi evitar un warning o error en la app usando:
        onGenerateRoute
       */
      onGenerateRoute: ( RouteSettings settings) {
        print('ruta llamada: ${settings.name}');
        //SIEMPRE DEBE RETORNAR UNA RUTA 
        return MaterialPageRoute(
          builder: ( BuildContext context) => AlertPage()
        );
      },
    );
  }
}