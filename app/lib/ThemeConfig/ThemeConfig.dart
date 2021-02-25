import 'package:app/ThemeConfig/provide_config.dart';
import 'package:flutter/material.dart';

import 'ThemeData.dart';

class ThemeConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('主题切换'),
        centerTitle: true,
      ),
        body:ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "白色",
                textAlign: TextAlign.left,
              ),
              onTap: () {
                ProvideConfig.value<ThemeConifgModel>(context).setThem(0);
              },
            ),
            ListTile(
              title: Text(
                "黑色",
                textAlign: TextAlign.left,
              ),
              onTap: () {
                ProvideConfig.value<ThemeConifgModel>(context).setThem(1);
              },
            ),
            ListTile(
              title: Text(
                "粉色",
                textAlign: TextAlign.left,
              ),
              onTap: () {
                ProvideConfig.value<ThemeConifgModel>(context).setThem(2);
              },
            ),
          ],
        ),
    );
  }
}
