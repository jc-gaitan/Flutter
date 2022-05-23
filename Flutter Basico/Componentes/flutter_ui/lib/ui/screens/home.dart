import 'package:flutter/material.dart';
import 'package:flutter_ui/ui/screens/screen_business_detail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ElevatedButton(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScreenBusiness()),
              ),
          child: Text("GO")),
    );
  }
}
