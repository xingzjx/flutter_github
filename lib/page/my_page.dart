import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPage createState() {
    // TODO: implement createState
    return _MyPage();
  }
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
      body: new Center(
        child: Icon(
          Icons.person,
          size: 130.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
