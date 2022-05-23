import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:formvalidation/src/models/productor_model.dart';
import 'package:formvalidation/src/providers/productos_provider.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  final scaffolKey = GlobalKey<ScaffoldState>();

  final productosProvider = new ProductosProvider();

  ProductoModel producto = new ProductoModel();

  bool _guardando = false;

  File? foto;

  @override
  Widget build(BuildContext context) {
    final Object? proData = ModalRoute.of(context)!.settings.arguments;

    if (proData != null) {
      producto = proData as ProductoModel;
    }

    return Scaffold(
      key: scaffolKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            onPressed: _seleccionarFoto,
            icon: Icon(Icons.photo_size_select_actual),
          ),
          IconButton(
            onPressed: _tomarFoto,
            icon: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
      ),
      //onSaved se ejecuta solo cuando el campo cumple con las validaciones
      onSaved: (value) => producto.titulo = value!,
      validator: (value) {
        if (value!.trim().length < 3) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      onSaved: (value) => producto.valor = double.parse(value!),
      validator: (value) {
        if (utils.isNumeric(value!)) {
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        producto.disponible = value;
      }),
    );
  }

  Widget _crearBoton() {
    return ElevatedButton.icon(
      onPressed: (_guardando) ? null : _submit,
      icon: Icon(Icons.save),
      label: Text('Guardar'),
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 16.0),
      ),
    );
  }

  void _submit() async {
    if (!formKey.currentState!.validate()) return;

    /* Si el formulario no es valido no ejecuta las demas lineas de codigo */

    print("Formulario valido");

    //ejecuta en onSaved de los TextFiel
    formKey.currentState!.save();

    setState(() {
      _guardando = true;
    });

    if (foto != null) {
      producto.fotoUrl = await productosProvider.subirImagen(foto!);
    }

    if (producto.id == '') {
      productosProvider.crearProducto(producto);
    } else {
      productosProvider.editarProducto(producto);
    }

    mostrarSnackBar('Registro Guardado. ');

    Navigator.pop(context);

    /*if (formKey.currentState!.validate()) {
      //codigo de cuando el formulario en valido
    }*/
  }

  void mostrarSnackBar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Widget _mostrarFoto() {
    if (producto.fotoUrl != 'none') {
      return (producto.fotoUrl == 'none')
          ? Image(image: AssetImage('assets/no-image.png'))
          : FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(producto.fotoUrl),
              height: 300.0,
              fit: BoxFit.cover,
            );
    } else {
      return Image(
        //image: AssetImage(foto?.path ?? 'assets/no-image.png'),
        image: (foto != null)
            ? Image.file(foto!).image
            : AssetImage('assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource origen) async {
    PickedFile? img = await ImagePicker().getImage(source: origen);

    if (img != null) {
      foto = new File(img.path);
    }

    if (foto != null) {
      producto.fotoUrl = 'none';
    }

    setState(() {});
  }
}
