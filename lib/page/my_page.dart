import 'package:flutter/material.dart';

import 'language_page.dart';

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
    return Column(
      children: <Widget>[_buildHeader(), _buildMenus()],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text("登入头像"),
    );
  }

  Widget _buildMenus() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.color_lens),
          title: Text("换肤 "),
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text("语言"),
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LanguagePage();
          })),
        ),
      ],
      shrinkWrap: true,
    );
  }
}
