import 'package:flutter/material.dart';

class InputPages extends StatefulWidget {

  @override
  _InputPagesState createState() => _InputPagesState();
}

class _InputPagesState extends State<InputPages> {
  
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Container'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }
  
   _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('Letras: ${ _nombre?.length }'), //Contador de caracteres
        hintText: 'Nombre de la persona', // Es el placeholder
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility), //icono interno
        icon: Icon(Icons.account_circle), //icono externo
        
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
        print(_nombre);
      },
    );
  }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'Email', // Es el placeholder
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email), //icono interno
        icon: Icon(Icons.email), //icono externo
      ),
      onChanged: (value) => setState(() {
        _email = value;
      })
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'Password', // Es el placeholder
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock), //icono interno
        icon: Icon(Icons.lock), //icono externo
      ),
      onChanged: (value) => setState(() {
        _password = value;
      })
    );
  }

  _crearFecha(BuildContext context) {
     return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        hintText: 'Fecha de nacimiento', // Es el placeholder
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar), //icono interno
        icon: Icon(Icons.calendar_today), //icono externo
      ),
      onTap: () {
        //para quitar el focus
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if ( picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder 
      ));
    });
    return lista;
  }

  _crearDropdown() {
    
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              print(opt);
              setState(() {
                _opcionSeleccionada = opt.toString();
              });
            },
          ),
        )
      ],
    );
  }
}