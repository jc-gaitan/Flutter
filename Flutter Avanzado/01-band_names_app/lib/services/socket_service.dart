import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    // Dart client
    IO.Socket socket = IO.io(
      'http://192.168.20.21:3000/',
    );
    //
    socket.onConnect((_) => print('CONNECT'));
    //
    socket.onDisconnect((_) => print('DISCONNECT'));
  }
}
