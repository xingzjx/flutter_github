import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPage createState() {
    // TODO: implement createState
    return _RecommendPage();
  }
}

class _RecommendPage extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('推荐'),
      ),
      body: new Center(
        child: Icon(
          Icons.lock,
          size: 130.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
