import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => new _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool? _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Slider Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            Expanded(child: _crearImagen()),
            SizedBox(
              height: 20.0,
            ),
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
          ],
        ),
      ),
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck!,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearCheckBox() {
    /*return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );*/

    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://i0.wp.com/bobalicon.com/wp-content/uploads/2021/04/Captura-de-Pantalla-2021-04-19-a-las-14.55.02.png?resize=1024%2C586&ssl=1'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      //label: 'Tamaño de la imagen ${_valorSlider}',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 300.0,
      onChanged: (_bloquearCheck!)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }
}
