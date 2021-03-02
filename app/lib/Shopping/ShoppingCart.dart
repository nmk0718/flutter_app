import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  String _message = "";

  @override
  void initState(){
  super.initState();
  }
  void didChangeDependencies(){
    super.didChangeDependencies();
    bool isFirst = ModalRoute.of(context).isFirst;
    bool isCurrent = ModalRoute.of(context).isCurrent;
    bool isActive = ModalRoute.of(context).isActive;
    if (isActive){
      RouteSettings routeSettings = ModalRoute.of(context).settings;
      Map<String, String> arguments = routeSettings.arguments;
      print("接收到参数 ${arguments["name"]} isCurrent$isCurrent isFirst$isFirst isActive$isActive");

      _message = arguments.toString();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        SizedBox(height: 200,),
        FlatButton(
          child: Text("关闭当前页面"),
          onPressed: () {
            CloseShoppingFunction();
          },
      ),
      Text("接收到的数据是 $_message"),
    ]),
    );
  }
  void CloseShoppingFunction(){
    Map<String,String> resultMap = new Map();
    resultMap["result"] = "AESC";
    Navigator.of(context).pop(resultMap);
  }
}
