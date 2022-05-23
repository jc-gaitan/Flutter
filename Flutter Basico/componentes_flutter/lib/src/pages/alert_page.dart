import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_left),
        onPressed: () {
          Navigator.pop(context); //volver hacia atras
        },
      ),
      body: Center(
        child: Column(
          //centrar componentes
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              //estilo del boton
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              child: Text("Mostrar Alerta"),
              onPressed: () => _mostrarAlert(context),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              //estilo del boton
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              child: Text("Mostrar Success"),
              onPressed: () => _mostrarSuccess(context),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              //estilo del boton
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              child: Text("Mostrar Error"),
              onPressed: () => _mostrarError(context),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      //true -> cierra el dialog al dar clic fuera de el
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          //borde redondiado
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text(
            "Titulo",
            //centrar texto
            textAlign: TextAlign.center,
          ),
          content: Column(
            //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Este es el contenido de la alerta"),
              FlutterLogo(
                size: 100,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Ok"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _mostrarSuccess(BuildContext context) {
    showDialog(
      context: context,
      //true -> cierra el dialog al dar clic fuera de el
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          //borde redondiado
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/success.gif',
                fit: BoxFit.cover,
                height: 100,
              ),
              Text(
                "Exito",
                //centrar texto
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Column(
            //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Se ha iniciado sesión correctamente. "),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                ),
                child: Text("Ok"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        );
      },
    );
  }

  void _mostrarError(BuildContext context) {
    showDialog(
      context: context,
      //true -> cierra el dialog al dar clic fuera de el
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          //borde redondiado
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/error.gif',
                fit: BoxFit.cover,
                height: 100,
              ),
              Text(
                "Error",
                //centrar texto
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Column(
            //tamaño de la columna max -> maximo, min -> se adapta altamaño del contenido que tenga dentro
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("No se ha podido iniciar sesion. "),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                ),
                child: Text("Ok"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        );
      },
    );
  }
}
