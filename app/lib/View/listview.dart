import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/post_show.dart';
import '../model/post.dart';
import '../model/tagoreinfo.dart';

class listview extends StatefulWidget {
  listviewState createState() => listviewState();
}

class listviewState extends State<listview> {
 // List<Map<String,String>> posts = [];
  void getTagore() async {
    //检测网络是否异常,先试用控制台打印,后更改为提示框
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint('网络连接异常');
      return;
    }
    //传参
    var dio = Dio();
    Response response = await dio.post("http://121.4.147.189:9090/Tagore");

    json.decode(response.toString());
    TagoreInfo tagoretinfo =
    TagoreInfo.fromJson(json.decode(response.toString()));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTagore();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('首页'),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder:(c,index){
          return Container();
        },
      ),

    );
  }

  Widget _ListItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  posts[index].imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10.0),
              Text(posts[index].title,
                  style: Theme.of(context).textTheme.title),
              Text(posts[index].author,
                  style: Theme.of(context).textTheme.subhead),
              SizedBox(
                height: 16.0,
              )
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => post_show(post: posts[index])));
                  }),
            ),
          ),
        ],
      ),
    );
  }


}

