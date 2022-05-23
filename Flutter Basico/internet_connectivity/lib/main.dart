import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connectivity/appbar.dart';
import 'package:internet_connectivity/dialog.dart';
import 'package:internet_connectivity/login.dart';

void main() {
  runApp(InternetConnectivity());
}

class InternetConnectivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  // ignore: cancel_subscriptions
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription!.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Example'),
      ),
      body: Column(
        children: [
          Text(
            'Connection Status: $_connectionStatus',
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomAppBar()),
              );
            },
            child: Text('appbar'),
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPlugin()),
              );
            },
            child: Text('Dialog'),
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
          ),
        ],
      ),
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        setState(() => _connectionStatus = result.toString());
        break;
      case ConnectivityResult.none:
        setState(() {
          _connectionStatus = 'No Internet Connection';
          showDialog();
        });
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  void showDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.RIGHSLIDE,
      headerAnimationLoop: true,
      title: 'Error',
      desc: 'No hay conexion a internet',
      btnOkOnPress: () {},
      btnOkColor: Colors.red,
    ).show();
  }
}
