import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class basic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('页面'),
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.add),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(value: 'Home',child: Text('Home')),
                PopupMenuItem(value: 'Discover',child: Text('Discover')),
                PopupMenuItem(value: 'Community',child: Text('Community')),
              ]
          ),
        ],
      ),
    );
  }
}
