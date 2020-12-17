import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'home.dart';

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

  void submitloginForm() {
    if (loginFromKey.currentState.validate()) {
      loginFromKey.currentState.save();

      debugPrint('账号: $username');
      debugPrint('密码: $password');
      if (username == '18516566171' && password == 'nimingkun') {
        //提示注册中
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('登录成功')));
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => home()),
            (route) => route == null);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('登录失败')));
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
              prefixIcon: Icon(Icons.person_outline),
              hintText: '请输入账号/手机号/邮箱',
              helperText: '',
            ),
            validator: (value) {
              if (value.length >= 12) {
                return "请使用正确的账号";
              } else if (value.length <= 10) {
                return "请使用正确的账号";
              }
            },
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
            validator: (value) {
              if (value.length <= 8) {
                return "请使用正确的密码";
              } else if (value.length >= 16) {
                return "请使用正确的密码";
              }
            },
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
            //onPressed: (){Navigator.pushNamed(context, '/home');},
          ),
        ),
      ]),
    );
  }
}
