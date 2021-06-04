import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'DraggableScrollableSheet',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drag your Receipe'),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/img.jfif',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.13,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollcontroller) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: ListView.builder(
                      itemCount: 20,
                      controller: scrollcontroller,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                          title: Text("asd"),
                          trailing: Icon(Icons.add),
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
