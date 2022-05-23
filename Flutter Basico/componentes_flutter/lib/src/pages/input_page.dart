import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";

  List<String> _palabras = ['asd', 'eqw', 'qwerty', 'jhggf'];

  String _opcionSeleccionada = 'asd';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
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
          Divider(),
          _textInputPasswordMio(),
          Divider(),
          _textInputEmailMio(),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDrowdown() {
    List<DropdownMenuItem<String>> lista = [];
    _palabras.forEach((palabra) {
      lista.add(DropdownMenuItem(
        child: Text(palabra),
        value: palabra,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 20.0,
        ),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDrowdown(),
          onChanged: (option) {
            setState(() {
              _opcionSeleccionada = option.toString();
            });
          },
        ),
      ],
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today), //icono final
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        //quitar el foco
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _fecha = _fecha.substring(0, 10);
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.visibility_off), //icono final
        icon: Icon(Icons.password),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Correo electronico',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email), //icono final
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearInput() {
    return TextField(
      // true -> para que entre a este input apenas cargue la pagina
      autofocus: false,
      //por la primera letra en mayusucla de cada palabra
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text("Cantidad de letras: ${_nombre.length}"),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility), //icono final
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: " + _nombre),
      subtitle: Text("Email: " + _email + "Password: " + _password),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _textInputEmailMio() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        labelText: 'Email',
        prefixIcon: const Padding(
          padding: const EdgeInsets.only(top: 1.0, left: 8),
          child: const Icon(Icons.email),
        ),
      ),
    );
  }

  Widget _textInputPasswordMio() {
    bool _passwordVisible = false; //variable para poder ver contraseña

    return StatefulBuilder(builder: (_context, _setState) {
      // only following widget gets update when _setState is used
      return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ), //borde bonito
          //icon para ver contraseña
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            padding: const EdgeInsets.only(right: 8),
            onPressed: () {
              // use _setState that belong to StatefulBuilder
              _setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          //hint
          labelText: 'Password',
          //icono de password
          prefixIcon: const Padding(
            padding: const EdgeInsets.only(top: 1.0, left: 8),
            child: const Icon(Icons.lock),
          ),
        ),
        obscureText: !_passwordVisible,
      );
    });
  }
}
