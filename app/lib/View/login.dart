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
  String username, password;
  bool autovalidate = false;

  void submitRegisterForm() {
    if (registerFromKey.currentState.validate()) {
      registerFromKey.currentState.save();

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
        key: registerFromKey,
        child: Column(
          children: <Widget>[
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
                onPressed: submitRegisterForm,
                //onPressed: (){Navigator.pushNamed(context, '/home');},
              ),
            )
          ],
        ));
  }
}
