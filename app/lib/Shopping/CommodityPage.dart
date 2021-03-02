import 'package:flutter/material.dart';

class CommodityPage extends StatefulWidget {
  @override
  _CommodityPageState createState() => _CommodityPageState();
}

class _CommodityPageState extends State<CommodityPage> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200,),
          ElevatedButton(
            onPressed: () {
              ShoppingFunction();
            },
            child: Text("点击打开B页面"),
          ),
          ElevatedButton(
            onPressed: () {
              ShoppingAndResultFunction();
            },
            child: Text("点击打开B页面,并获取B页面回传的参数"),
          ),
          Container(
            child: Text("页面B返回数据为 $result"),
          ),
        ],
      ),
    );
  }

  void ShoppingFunction() {
    Map<String, String> map = new Map();
    map["name"] = "张三";
    Navigator.of(context).pushNamed("/shopping", arguments: map);
  }

  void ShoppingAndResultFunction() {
    Map<String, String> map = new Map();
    map["name"] = "张三";
    Navigator.of(context).pushNamed("/shopping", arguments: map).then((value){
      if (value != null){
        Map<String,String> resultMap = value;
        print("页面二回传的数据是${resultMap['result']}");

        setState(() {
          result = resultMap.toString();
        });
      }
    });
  }

}
