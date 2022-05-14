import 'package:flutter/material.dart';
import 'package:stream_bloc/bloc/productos_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //
  final productosBloc = ProductosBloc();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: productosBloc.productosContador,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text("Productos (${snapshot.data ?? 0})");
            },
          ),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: productosBloc.getProductos,
          builder: (context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.hasData) {
              final products = snapshot.data;
              return ListView.builder(
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products[index]),
                  );
                },
              );
            } else {
              return const Center(child: Text("No hay datos"));
            }
          },
        ),
      ),
    );
  }
}
