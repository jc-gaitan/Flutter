import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_example/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_cubit_example/pages/pagina1_page.dart';
import 'package:flutter_cubit_example/pages/pagina2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsuarioCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1Page(),
          'pagina2': (_) => Pagina2Page(),
        },
      ),
    );
  }
}
