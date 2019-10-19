import 'package:flutter/material.dart';
import 'package:flutter_github/page/login_page.dart';
import 'package:provider/provider.dart';

import 'page/main_page.dart';
import 'states/profile_change_notifier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, Widget child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: themeModel.theme,
            ),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("登入"),
        ),
        body: _buildLoginUI());
  }

  Widget _buildLoginUI() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
                autofocus: true,
                // controller: _unameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  prefixIcon: Icon(Icons.lock),
                ),
                // 校验用户名（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : "请输入用户名";
                }),
            TextFormField(
                autofocus: true,
                // controller: _unameController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.person),
                ),
                // 校验用户名（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : "请输入密码";
                }),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 55.0),
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: _onLogin,
                  textColor: Colors.white,
                  child: Text("登入"),
                ),
              ),
            ),
          ],
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods;
  }

  void _onLogin() {
    print("登入===============111=");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainPage();
    }));
  }
}
