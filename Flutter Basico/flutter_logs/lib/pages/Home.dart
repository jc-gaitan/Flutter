import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../components/search/country_search.dart';
import '../models/country.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  late String title;

  late Country paisSeleccionado;
  List<Country> historial = [];

  @override
  void initState() {
    title = "Rutas";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        appBar: SliderAppBar(
          appBarColor: Colors.white,
          title: Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          trailing: IconButton(
            onPressed: () async {
              final pais = await showSearch(
                  context: context,
                  delegate: CountrySearchDelegate('Buscar...', historial));

              setState(() {
                paisSeleccionado = pais as Country;
                historial.insert(0, pais);
              });
            },
            icon: const Icon(Icons.search),
            splashRadius: 20.0,
          ),
        ),
        key: _key,
        sliderOpenSize: 179,
        slider: _SliderView(
          onItemClick: (title) {
            _key.currentState!.closeSlider();
            setState(
              () {
                (title == "Pasajero")
                    ? this.title = "Rutas"
                    : this.title = title;
              },
            );
          },
        ),
        child: _AuthorList(),
      ),
    );
  }
}

class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/user_profile.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'CAMILO',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'BalsamiqSans'),
            ),
            const SizedBox(
              height: 20,
            ),
            _SliderMenuItem(
                title: 'Pasajero', iconData: Icons.person, onTap: onItemClick),
            _SliderMenuItem(
                title: 'Conductor',
                iconData: Icons.airport_shuttle,
                onTap: onItemClick),
            _SliderMenuItem(
                title: 'Vehiculo',
                iconData: Icons.directions_car,
                onTap: onItemClick),
            _SliderMenuItem(
                title: 'Caminata, bici, patineta',
                iconData: Icons.directions_bike,
                onTap: onItemClick),
            _SliderMenuItem(
                title: 'Reportes',
                iconData: Icons.analytics_outlined,
                onTap: onItemClick),
            _SliderMenuItem(
                title: 'Cerrar sesión',
                iconData: Icons.logout,
                onTap: onItemClick),
          ],
        ),
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontFamily: 'BalsamiqSans_Regular'),
      ),
      leading: Icon(iconData, color: Colors.black),
      onTap: () => onTap?.call(title),
    );
  }
}

class _AuthorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Data> dataList = [];
    dataList.add(Data(Colors.amber, 'Jose Antonio Rivera',
        'Origen: Usme \nDestino: Oficina calle 93'));
    dataList.add(Data(Colors.orange, 'Jose Antonio Rivera',
        'Origen: Calle 25#9-25 \nDestino: Calle 25#9-25'));
    dataList.add(Data(Colors.deepOrange, 'Jose Antonio Rivera',
        'Origen: Calle 25#9-25 \nDestino: Calle 25#9-25'));
    dataList.add(Data(Colors.red, 'Jose Antonio Rivera',
        'Origen: Calle 25#9-25 \nDestino: Calle 25#9-25'));
    dataList.add(Data(Colors.purple, 'Jose Antonio Rivera',
        'Origen: Calle 25#9-25 \nDestino: Calle 25#9-25'));
    dataList.add(Data(Colors.green, 'Jose Antonio Rivera',
        'Origen: Calle 25#9-25 \nDestino: Calle 25#9-25'));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          //   physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (builder, index) {
            return LimitedBox(
              maxHeight: 150,
              child: Container(
                decoration: BoxDecoration(
                    color: dataList[index].color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 12.0,
                      ),
                      child: Text(
                        dataList[index].name,
                        style: const TextStyle(
                            fontFamily: 'BalsamiqSans_Blod',
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 12.0,
                      ),
                      child: Text(
                        dataList[index].detail,
                        style: const TextStyle(
                            fontFamily: 'BalsamiqSans_Regular',
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (builder, index) {
            return const Divider(
              height: 10,
              thickness: 0,
            );
          },
          itemCount: dataList.length),
    );
  }
}

class Data {
  MaterialColor color;
  String name;
  String detail;

  Data(this.color, this.name, this.detail);
}

class ColoursHelper {
  static Color blue() => const Color(0xff5e6ceb);

  static Color blueDark() => const Color(0xff4D5DFB);
}
