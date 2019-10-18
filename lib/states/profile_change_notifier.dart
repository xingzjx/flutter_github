// import '../index.dart';
export 'package:flutter_github/common/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/global.dart';
import 'package:flutter_github/models/profile.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    super.notifyListeners(); //通知依赖的Widget更新
  }
}

class LocaleModel extends ProfileChangeNotifier {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale getLocale() {
    if (_profile.locale == null) return null;
    var t = _profile.locale.split("_");
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String get locale => _profile.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale) {
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }
}
