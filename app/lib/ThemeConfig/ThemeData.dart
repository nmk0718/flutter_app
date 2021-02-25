import 'package:flutter/material.dart';

//定义程序中所使用的主题
class ThemeConifgModel with ChangeNotifier{

  //亮色主题
  final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    highlightColor: Colors.black12,
    splashColor: Colors.white70,
    accentColor: Colors.lightBlue,
  );
  //暗色主题
  final ThemeData dartTheme = ThemeData(
    primaryColor: Colors.black,
    highlightColor: Colors.black12,
    splashColor: Colors.white70,
    accentColor: Colors.lightBlue,
  );
  //紫色主题
  final ThemeData pinkTheme = ThemeData(
    primaryColor: Colors.pink,
    highlightColor: Colors.black12,
    splashColor: Colors.white70,
    accentColor: Colors.lightBlue,
  );

  //亮色主题
   ThemeData defalutTheme = ThemeData(
     primaryColor: Colors.yellow,
     highlightColor: Colors.black12,
     splashColor: Colors.white70,
     accentColor: Colors.lightBlue,
  );

  void setThem(num index){
    switch(index){
      case 0:
        defalutTheme = lightTheme;
        break;
      case 1:
        defalutTheme = dartTheme;
        break;
      case 2:
        defalutTheme = pinkTheme;
        break;
    }
    notifyListeners();
  }
}