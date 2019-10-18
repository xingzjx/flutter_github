// import '../index.dart';

import 'package:flutter/material.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  // Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    super.notifyListeners(); //通知依赖的Widget更新
  }
}

class LocaleModel extends ChangeNotifier {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale getLocale() {
    // if (locale == null) return null;
    var t = locale;
    if (t == null) t = "zh_CN";
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String _locale;

  // ignore: unnecessary_getters_setters
  String get locale => _locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale) {
    _locale = locale;
    notifyListeners();
  }
}
