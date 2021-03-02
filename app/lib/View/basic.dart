import 'package:app/Movie/MoviePage.dart';
import 'package:app/Music/MusicPage.dart';
import 'package:app/Shopping/ShoppingCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ScanPage.dart';

enum WhyFarther { add, delet }

class basic extends StatefulWidget {
  basicState createState() => basicState();
}

class basicState extends State<basic> {
  String content = '';

  Menu() async {
    String result = await showMenu(
        context: context,
        elevation: 0.0,
        position: RelativeRect.fromLTRB(100.0, 110, 0.0, 100.0),
        color: Colors.black12,
        items: <PopupMenuEntry<String>>[
          PopupMenuItem(
            value: 'Home',
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                  child: Icon(Icons.home),
                ),
                Text('Home'),
              ],
            ),
          ),
          PopupMenuDivider(
            height: 1.0,
          ),
          PopupMenuItem(
              value: 'scan',
              child: Row(children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                    child: Icon(Icons.camera_alt)),
                Text('扫一扫')
              ])),
          PopupMenuDivider(
            height: 1.0,
          ),
          PopupMenuItem(
              value: 'community',
              child: Row(children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                    child: Icon(Icons.camera)),
                Text('community')
              ])),
        ]);
    switch (result) {
      case 'Home':
        print('点击了Home');
        break;
      case 'scan':
        print('点击了scan');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScanPage()),
        );
        break;
      case 'community':
        print('点击了community');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('页面'),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Menu();
                  }),
            ],
            bottom: TabBar(
                unselectedLabelColor: Colors.black38,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.music_note)),
                  Tab(icon: Icon(Icons.slow_motion_video_sharp)),
                ])),
        body: TabBarView(
          children: <Widget>[
            MusicPage(),
            MoviePage(),
          ],
        ),
      ),
    );
  }
}
