import 'package:flutter/material.dart';
import 'package:inventario/controllers/inventory_controller.dart';
import 'package:inventario/models/product_model.dart';
import 'package:inventario/widgets/listview_products.dart';

class SearchInventory extends SearchDelegate {
  InventoryController controller;

  SearchInventory(this.controller);

  String seleccion = '';

  @override
  String get searchFieldLabel => 'Buscar nombre de producto';

  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: Colors.grey[400],
        fontSize: 14.0,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      hintColor: const Color.fromRGBO(255, 255, 255, 0.5),
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blueAccent,
        //systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      scaffoldBackgroundColor: Colors.white,
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blueGrey), // cursor color
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //Acciones de nuestro AppBar
    return [
      IconButton(
        onPressed: () {
          //variable que manejas el search -> texto que escribe el usuario
          query = '';
        },
        splashRadius: 20.0,
        icon: const Icon(
          Icons.clear,
          color: Colors.white,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //icono a la izquierda del AppBar
    return IconButton(
      splashRadius: 20.0,
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: controller.searchProducts(query.toUpperCase()),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListViewProducts(products: snapshot.data!);
            } else {
              return const Center(
                child: Text("No se encontraron negocios."),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: controller.searchProducts(query.toUpperCase()),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListViewProducts(products: snapshot.data!);
            } else {
              return const Center(
                child: Text("No se encontraron negocios."),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }
}
