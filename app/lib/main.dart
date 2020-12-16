import 'package:flutter/material.dart';
import 'package:app/View/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'View/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext) {
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
          '/login': (context) => login(),
          '/home': (context) => home(),
        },
        theme: ThemeData(
          //顶部颜色
          primarySwatch: Colors.yellow,
          highlightColor: Colors.black12,
          splashColor: Colors.white70,
          accentColor: Colors.lightBlue,
        )
    );
  }
}


