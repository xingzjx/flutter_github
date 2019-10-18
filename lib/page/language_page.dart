import 'package:flutter/material.dart';
import 'package:flutter_github/i10n/localization_intl.dart';
import 'package:flutter_github/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

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
    // var localeModel = Provider.of<LocaleModel>(context);
    var gm = GmLocalizations.of(context);

    Widget _buildItem(String language, String value) {
      return ListTile(
        leading: const Icon(Icons.language),
        title: Text(language),
        //onTap: () => localeModel.locale = value,
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
