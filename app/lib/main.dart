import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app/View/register.dart';
import 'package:app/View/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Movie/PlayerMovie.dart';
import 'ThemeConfig/ThemeConfig.dart';
import 'ThemeConfig/ThemeData.dart';
import 'ThemeConfig/provide_config.dart';
import 'View/home.dart';

void main() {
  runApp(ProvideConfig.init(child: App()));
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return ProvideConfig.connect<ThemeConifgModel>(
        builder: (context, child, ThemeConifgModel model) {
      return MaterialApp(
        //国际化处理
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh', 'CN'),
          const Locale('en', 'US'),
        ],
        debugShowCheckedModeBanner: false,
        //home: NavigatorDemo(),
        //初始根路由
        initialRoute: '/home',
        routes: {
          '/register': (context) => register(),
          '/login': (context) => login(),
          '/home': (context) => home(),
          '/ThemeConfig': (context) => ThemeConfig(),
          '/movie': (context) => VideoScreen(),
        },
        theme: model.defalutTheme,
      );
    });
  }
}
