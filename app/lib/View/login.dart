import 'dart:convert';
import 'dart:convert' show json;
import 'package:app/model/user_login.dart';
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
  bool autovalidate = false;

  TextEditingController login_email = TextEditingController();
  TextEditingController login_password = TextEditingController();

  void submitloginForm() async {

    //检测网络是否异常,先试用控制台打印,后更改为提示框
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      debugPrint('网络连接异常');
      return;
    }
    if(login_email.text.length == 0 && login_password.text.length == 0){
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('账号密码不可为空')));
      return;
    }
    if (loginFromKey.currentState.validate()) {
      loginFromKey.currentState.save();

      //传参
      var dio = Dio();
      Map<String, String> map = Map();
      map['Email'] = login_email.text;
      map['PassWord'] = login_password.text;
      Response response =
      await dio.post("http://121.4.147.189:9090/login", data: map);

      //Response response = await dio.post("http://192.168.10.228:9090/login");
      //response.headers.set('content-type', 'application/json');
      json.decode(response.toString());
      user_login userlogin = user_login.fromJson(json.decode(response.toString()));

      debugPrint('账号:'+ login_email.text);
      debugPrint('密码:'+ login_password.text);
      //debugPrint(user_info.user.length.toString() + user_info.user[0].userPass);
      print(userlogin.code);
      if (userlogin.code == 1 ) {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('登录成功')));
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => home()),
                (route) => route == null);
      }else{
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('请确认账号密码是否正确')));
      }
      //前端判断登录验证
      //   for(var i = 0;i < user_info.user.length; i++){
      //     var abc_name = user_info.user[i].userName;
      //     var abc_password = user_info.user[i].userPass;
      //      print(i);
      //      print(abc_name);
      //      print(abc_password);
      //     if (username == abc_name && password == abc_password ) {
      //       //提示注册中
      //       Scaffold.of(context).showSnackBar(SnackBar(content: Text('登录成功')));
      //       Navigator.of(context).pushAndRemoveUntil(
      //           new MaterialPageRoute(builder: (context) => home()),
      //               (route) => route == null);
      //     } else {
      //       Scaffold.of(context).showSnackBar(SnackBar(content: Text('登录失败')));
      //     }
      // }

    } else {
      setState(() {
        autovalidate = true;
      });
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
              NetworkImage("https://s3.ax1x.com/2021/03/02/6FUzNt.jpg"),
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
              hintText: '请输入邮箱',
              helperText: '',
            ),
            controller: login_email,
            // validator: (value) {
            //   if (value.length >= 12) {
            //     return "请使用正确的账号";
            //   } else if (value.length <= 10) {
            //     return "请使用正确的账号";
            //   }
            // },
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
            controller: login_password,
            // validator: (value) {
            //   if (value.length <= 8) {
            //     return "请使用正确的密码";
            //   } else if (value.length >= 16) {
            //     return "请使用正确的密码";
            //   }
            // },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 0.0),
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: GestureDetector(
                  child: Text(
                    '注册账号',
                    style: TextStyle(
                        fontSize: 13.0, color: Color.fromARGB(255, 53, 53, 53)),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
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
                bottomLeft: Radius.circular(10.0),
              ),
            ),
            //onPressed: (){Navigator.pushNamed(context, '/home');},
          ),
        ),
      ]),
    );
  }
}
