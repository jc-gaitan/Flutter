import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://hipertextual.com/wp-content/uploads/2018/11/Stan-Lee.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/9/91/Oahu_Landscape.jpg'),
          fadeOutDuration: Duration(milliseconds: 200),
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
