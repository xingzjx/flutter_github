import 'package:flutter/material.dart';
import 'package:flutter_github/i10n/localization_intl.dart';
import 'package:flutter_github/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePage createState() {
    // TODO: implement createState
    return _ThemePage();
  }
}

class _ThemePage extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    var themeModel = Provider.of<ThemeModel>(context);

    var gm = GmLocalizations.of(context);

    Widget _buildItem(String language, ColorSwatch value) {
      return ListTile(
        title: Text(language),
        onTap: () => themeModel.theme = value
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('换肤'),
      ),
      body: ListView(
        children: <Widget>[
          _buildItem("红色", Global.themes[0]),
          _buildItem("蓝色", Global.themes[1]),
          _buildItem("黄色", Global.themes[2]),
        ],
        shrinkWrap: true,
      ),
    );
  }
}
