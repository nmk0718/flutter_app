import 'dart:convert';
import 'dart:convert' show json;
import 'package:app/model/userinfo.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'package:dio/dio.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('登录'),
        elevation: 0.0,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              loginFrom(),
            ],
          ),
        ),
      ),
    );
  }
}

class loginFrom extends StatefulWidget {
  loginFromState createState() => loginFromState();
}

class loginFromState extends State<loginFrom> {
  final loginFromKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submitloginForm() async {

    //检测网络是否异常,先试用控制台打印,后更改为提示框
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
        debugPrint('网络连接异常');
      return;
    }
    var dio = Dio();
    Response response = await dio.post("http://192.168.10.228/jar/");
    //response.headers.set('content-type', 'application/json');
    json.decode(response.toString());
    userinfo user_info = userinfo.fromJson(json.decode(response.toString()));


    if (loginFromKey.currentState.validate()) {
      loginFromKey.currentState.save();

      debugPrint('账号: $username');
      debugPrint('密码: $password');
      debugPrint(user_info.user.length.toString() +  user_info.user[0].userPass);

      for(var i = 0;i < user_info.user.length; i++){
        var abc_name = user_info.user[i].userName;
        var abc_password = user_info.user[i].userPass;
        // print(i);
        // print(abc_name);
        // print(abc_password);
        if (username == abc_name && password == abc_password ) {
          //提示注册中
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('登录成功')));
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context) => home()),
                  (route) => route == null);
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('登录失败')));
        }
    }

    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return '账号是必需的.';
    }
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return '密码是必需的';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFromKey,
      child: Column(children: <Widget>[
        SizedBox(height: 40.0),
        CircleAvatar(
          backgroundImage:
              NetworkImage("https://i1.100024.xyz/i/2020/12/16/nl8t60.jpg"),
          maxRadius: 100,
        ),
        SizedBox(height: 40.0),
        Theme(
          data: ThemeData(accentColor: Colors.lightBlue),
          child: TextFormField(
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(15.0),
              // ),
              prefixIcon: Icon(Icons.person_outline),
              hintText: '请输入账号/手机号/邮箱',
              helperText: '',
            ),
              // validator: (value) {
              //   if (value.length >= 12) {
              //     return "请使用正确的账号";
              //   } else if (value.length <= 10) {
              //     return "请使用正确的账号";
              //   }
              // },
            onSaved: (value) {
              username = value;
            },
          ),
        ),
        Theme(
          data: ThemeData(accentColor: Colors.lightBlue),
          child: TextFormField(
            obscureText: true,
            maxLength: null,
            inputFormatters: [LengthLimitingTextInputFormatter(16)],
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outlined),
              hintText: '请输入密码',
              helperText: '',
            ),
            // validator: (value) {
            //   if (value.length <= 8) {
            //     return "请使用正确的密码";
            //   } else if (value.length >= 16) {
            //     return "请使用正确的密码";
            //   }
            // },
            onSaved: (value) {
              password = value;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 0.0),
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child:GestureDetector(
                  child: Text(
                    '注册账号',
                    style: TextStyle(
                        fontSize: 13.0, color: Color.fromARGB(255, 53, 53, 53)),
                  ),
                  onTap: (){Navigator.pushNamed(context, '/register');},
                ),
              ),
              Text(
                '忘记密码？',
                style: TextStyle(
                    fontSize: 13.0, color: Color.fromARGB(255, 53, 53, 53)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          width: 180.0,
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text(
              '登录',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0.0,
            onPressed: submitloginForm,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft:  Radius.circular(10.0),
              ),
            ),
            //onPressed: (){Navigator.pushNamed(context, '/home');},
          ),
        ),
      ]),
    );
  }
}
