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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('换肤'),
      ),
      body: ListView(
        children: Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              //主题更新后，MaterialApp会重新build
              Provider.of<ThemeModel>(context).theme = e;
            },
          );
        }).toList(),
        shrinkWrap: true,
      ),
    );
  }
}
