import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
        centerTitle: true,
      ),
      body: new Center(
        child: Icon(
          Icons.home,
          size: 130.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
