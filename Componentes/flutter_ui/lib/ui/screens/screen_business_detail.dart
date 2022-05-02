import 'package:flutter/material.dart';

class ScreenBusiness extends StatefulWidget {
  ScreenBusiness({Key? key}) : super(key: key);

  @override
  State<ScreenBusiness> createState() => _ScreenBusinessState();
}

class _ScreenBusinessState extends State<ScreenBusiness> {
  //
  late ScrollController _scrollController;
  bool x = true; //abierto
  double botom = 2.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        /*setState(() {
          //_textColor = _isSliverAppBarExpanded ? Colors.white : Colors.blue;
          print(_isSliverAppBarExpanded);
        });*/
        //print(_isSliverAppBarExpanded);
        bool aux = _isSliverAppBarExpanded;
        //print(aux);
        if (aux == x) {
          //print("cerrado");
          //print("cambio");
          //x = !aux;
          //print(x);
          setState(() {
            x = !aux;
            (x) ? botom = 2.0 : botom = 16.0;
          });
        } else {
          //print("abierto");
        }
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return scaffold();
  }

  Widget scaffold() {
    return Scaffold(
      //1
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          //2
          SliverAppBar(
            floating: true,
            pinned: true,
            elevation: 50,
            backgroundColor: Colors.blueAccent,
            expandedHeight: 250.0,
            //
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              splashRadius: 20.0,
              iconSize: 30.0,
            ),
            /*actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.directions),
                splashRadius: 20.0,
                iconSize: 30.0,
                //padding: EdgeInsets.only(right: 16.0),
              ),
              const SizedBox(width: 16.0),
            ],*/
            //border inferior redondo
            /*shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),*/
            //
            flexibleSpace: FlexibleSpaceBar(
              title: /*Container(
                width: double.infinity,
                color: Colors.pink.withOpacity(0.2),
                padding: EdgeInsets.only(
                    bottom: botom, left: 2.0, right: 2.0, top: 2.0),
                child: const Text(
                  'PAISAJE',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),*/
                  Text(
                'Droguería la Economía',
                textScaleFactor: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0), //position of shadow
                        blurRadius: 6.0, //blur intensity of shadow
                        color: Colors.black
                            .withOpacity(0.8), //color of shadow with opacity
                      ),

                      //add more shadow with different position offset here
                    ]),
              ),
              centerTitle: true,
              //titlePadding: const EdgeInsets.all(0.0),
              background: Image.asset(
                'assets/images/img.png',
                fit: BoxFit.fill,
              ),
            ),
            //
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      child: const Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 40,
            ),
          ),
        ],
      ),
    );
  }
}
