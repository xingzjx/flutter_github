

import 'package:flutter_github/models/profile.dart';

import '../index.dart';

// 提供四套可选主题色
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];


class Global {

  static Profile profile = Profile();
  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;
}