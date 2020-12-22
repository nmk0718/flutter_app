import 'dart:convert';

import 'package:app/model/user_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'home.dart';
import 'package:dio/dio.dart';

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('注册'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterFrom(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterFrom extends StatefulWidget {
  RegisterFromState createState() => RegisterFromState();
}

class RegisterFromState extends State<RegisterFrom> {
  final registerFromKey = GlobalKey<FormState>();
  bool autovalidate = false;

  TextEditingController register_name = TextEditingController();
  TextEditingController register_password = TextEditingController();
  TextEditingController register_email = TextEditingController();
  TextEditingController register_phone = TextEditingController();
  TextEditingController register_confirm = TextEditingController();

  void submitRegisterForm() async {

    if (registerFromKey.currentState.validate()) {
      registerFromKey.currentState.save();
      if(register_password.text == register_confirm.text){
        ///post请求发送json
        String url = "http://192.168.10.228:9090/Add";
        ///创建Dio
        Dio input_info = new Dio();

        ///创建Map 封装参数
        Map<String, String> map = Map();
        map['Username'] = register_name.text;
        map['PassWord'] = register_password.text;
        map['Email'] = register_email.text;
        map['Phone'] = register_phone.text;

        ///发起post请求
        Response response = await input_info.post(url, data: map);
        json.decode(response.toString());
        user_login userregister = user_login.fromJson(json.decode(response.toString()));
        print(userregister.code);
        if (userregister.code == 1 ) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('登录成功')));
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context) => login()),
                  (route) => route == null);
        }else{
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('邮箱已注册')));
        }
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('两次密码不一致')));
      }

    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFromKey,
      child: Column(children: <Widget>[
        Theme(
          data: ThemeData(accentColor: Colors.lightBlue),
          child: TextFormField(
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              hintText: '请输入用户名',
              helperText: '',
            ),
            controller: register_name,
          ),
        ),
        Theme(
          data: ThemeData(accentColor: Colors.lightBlue),
          child: TextFormField(
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail_outline),
              hintText: '请输入邮箱',
              helperText: '',
            ),
            controller: register_email,
          ),
        ),
        Theme(
          data: ThemeData(accentColor: Colors.lightBlue),
          child: TextFormField(
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              hintText: '请输入手机号',
              helperText: '',
            ),
            controller: register_phone,
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
            controller: register_password,
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
              hintText: '请确认密码',
              helperText: '',
            ),
            controller: register_confirm,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          width: double.infinity,
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text(
              '注册',
              style: TextStyle(color: Colors.white),
            ),
            clipBehavior:  Clip.none,
            elevation: 0.0,
            onPressed: submitRegisterForm,
            //onPressed: (){Navigator.pushNamed(context, '/home');},
          ),
        ),
      ]),
    );
  }
}
