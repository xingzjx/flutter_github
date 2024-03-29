import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

const TAG = "\$";
const SRC = "./jsons"; //JSON 目录
const DIST = "lib/models/"; //输出model目录

void walk() {
  //遍历JSON目录生成模板
  var src = new Directory(SRC);
  var list = src.listSync();
  var template = "import 'package:json_annotation/json_annotation.dart';\r\n%t\npart '%s.g.dart';\r\n\r\n@JsonSerializable()\r\nclass %s {\r\n  %s();\r\n\r\n  %sfactory %s.fromJson(Map<String, dynamic> json) => _\$%sFromJson(json);\r\n\r\n  Map<String, dynamic> toJson() => _\$%sToJson(this);\r\n}\r\n";
  File file;
  list.forEach((f) {
    if (FileSystemEntity.isFileSync(f.path)) {
      file = new File(f.path);
      var paths = path.basename(f.path).split(".");
      String name = paths.first;
      if (paths.last.toLowerCase() != "json" || name.startsWith("_")) return;
      if (name.startsWith("_")) return;
      //下面生成模板
      var map = json.decode(file.readAsStringSync());
      //为了避免重复导入相同的包，我们用Set来保存生成的import语句。
      var set = new Set<String>();
      StringBuffer attrs = new StringBuffer();
      (map as Map<String, dynamic>).forEach((key, v) {
        if (key.startsWith("_")) return;
        /// #############################
        ///处理key包含"_"时，转为驼峰并加上@JsonKey(name="key")
        if (key.contains("_")) {
          attrs.write('@JsonKey(name: "$key")');
          attrs.write("\r\n  ");
          attrs.write(getType(v, set, name));
          attrs.write(" ");
          attrs.write(changeToCamelCase(key, false));
          attrs.writeln(";");
          attrs.write("\r\n  ");
        } else {
          attrs.write(getType(v, set, name));
          attrs.write(" ");
          attrs.write(key);
          attrs.writeln(";");
          attrs.write("\r\n  ");
        }
      });
      String className = "";
      /// #############################
      ///处理有"_"时class不是驼峰命名
      if (name.contains("_")) {
        className = changeToCamelCase(name, true);
      } else {
        className = name[0].toUpperCase() + name.substring(1);
      }
      var dist = format(template, [
        name,
        className,
        className,
        attrs.toString(),
        className,
        className,
        className
      ]);
      var _import = set.join(";\r\n");
      _import += _import.isEmpty ? "" : ";";
      dist = dist.replaceFirst("%t", _import);
      //将生成的模板输出
      new File("$DIST$name.dart").writeAsStringSync(dist);
    }
  });

}
/// #############################
///转为驼峰命名
///big 是否大驼峰
String changeToCamelCase(String word, bool big) {
  if (word.contains("_")) {
    String result = "";
    List<String> words = word.split("_");
    for (var value in words) {
      result += (value[0].toUpperCase() + value.substring(1).toLowerCase());
    }
    return big ? result : (result[0].toLowerCase() + result.substring(1));
  } else {
    return big
        ? word[0].toUpperCase() + word.substring(1)
        : word[0].toLowerCase() + word.substring(1);
  }
}

String changeFirstChar(String str, [bool upper = true]) {
  return (upper ? str[0].toUpperCase() : str[0].toLowerCase()) +
      str.substring(1);
}

//将JSON类型转为对应的dart类型
String getType(v, Set<String> set, String current) {
  current = current.toLowerCase();
  if (v is bool) {
    return "bool";
  } else if (v is num) {
    return "num";
  } else if (v is Map) {
    return "Map<String,dynamic>";
  } else if (v is List) {
    return "List";
  } else if (v is String) {
    /// #############################
    ///添加DateTime类型
    try {
      DateTime dateTime = DateTime.parse(v);
      if (dateTime != null) {
        return "DateTime";
      }
    } catch (e) {}

    //处理特殊标志
    if (v.startsWith("$TAG[]")) {
      var className = changeFirstChar(v.substring(3), false);
      if (className.toLowerCase() != current) {
        set.add('import "$className.dart"');
      }
      /// #############################
      /// 自定义model类型名字大驼峰命名
      return "List<${changeToCamelCase(className, true)}>";
    } else if (v.startsWith(TAG)) {
      var fileName = changeFirstChar(v.substring(1), false);
      if (fileName.toLowerCase() != current) {
        set.add('import "$fileName.dart"');
      }
      /// #############################
      /// 自定义model类型名字大驼峰命名
      return changeToCamelCase(fileName, true);
    }
    return "String";
  } else {
    return "String";
  }
}

//替换模板占位符
String format(String fmt, List<Object> params) {
  int matchIndex = 0;
  String replace(Match m) {
    if (matchIndex < params.length) {
      switch (m[0]) {
        case "%s":
          return params[matchIndex++].toString();
      }
    } else {
      throw new Exception("Missing parameter for string format");
    }
    throw new Exception("Invalid format string: " + m[0].toString());
  }

  return fmt.replaceAllMapped("%s", replace);
}

void main() {
  walk();
}