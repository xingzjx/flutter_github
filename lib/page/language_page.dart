import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePage createState() {
    // TODO: implement createState
    return _LanguagePage();
  }
}

class _LanguagePage extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    void _selectLanguage() {}

    Widget _buildItem(String language, String value) {
      return ListTile(
        leading: const Icon(Icons.language),
        title: Text(language),
        onTap: () => _selectLanguage(),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('语言切换'),
      ),
      body: ListView(
        children: <Widget>[
          _buildItem("中文", "zh_CN"),
          _buildItem("English", "en_US"),
          _buildItem("跟随系统", null),
        ],
        shrinkWrap: true,
      ),
    );
  }
}
