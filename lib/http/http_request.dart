import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_github/common/global.dart';
import 'package:flutter_github/models/user.dart';

import '../index.dart';

class HttpRequest {
  Options _options;
  BuildContext context;

  HttpRequest([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://api.github.com/',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
    },
  ));

  Future<User> login(String login, String pwd) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    var r = await dio.get(
      "/users/$login",
      options: _options.merge(headers: {
        HttpHeaders.authorizationHeader: basic
      }, extra: {
        "noCache": true, //本接口禁用缓存
      }),
    );
    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    //更新profile中的token信息
    Global.profile.token = basic;
    print("登入接口：" + r.data);
    return User.fromJson(r.data);
  }
}
