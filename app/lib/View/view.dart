import 'package:flutter/material.dart';
import '../model/post.dart';
import 'login.dart';

class view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Scaffold(
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new RaisedButton(
            child: new Text('退出登录'),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context) => login()),
                      (route) => route == null);
            }
            ),
      ),
    );
  }
}
