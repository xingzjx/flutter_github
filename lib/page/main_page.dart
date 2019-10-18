import 'package:flutter/material.dart';
import 'recommend_page.dart';

import 'home_page.dart';
import 'my_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() {
    // TODO: implement createState
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  List<Widget> pages = new List();
  int _currentIndex = 0;

  @override
  void initState() {
    pages..add(HomePage())..add(RecommendPage())..add(MyPage());
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //底部导航栏的创建需要对应的功能标签作为子项，这里我就写了3个，每个子项包含一个图标和一个title。
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: new Text(
                '首页',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lock,
              ),
              title: new Text(
                '推荐',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: new Text(
                '我的',
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
            print(i);
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}
