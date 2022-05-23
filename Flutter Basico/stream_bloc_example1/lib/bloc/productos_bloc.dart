//
import 'dart:async';

const productoS = ["micro", "parlantes", "audifonos", "reloj"];

class ProductosBloc {
  //
  Stream<List<String>> get getProductos async* {
    final List<String> productos = [];

    for (String producto in productoS) {
      //esperar para ver los cambios
      await Future.delayed(const Duration(seconds: 2));

      productos.add(producto);

      yield productos;
    }
  }

  //
  final StreamController<int> _productosContador = StreamController<int>();
  Stream<int> get productosContador => _productosContador.stream;

  //
  ProductosBloc() {
    getProductos
        .listen((productList) => _productosContador.add(productList.length));
  }

  dispose() {
    _productosContador.close();
  }
}
