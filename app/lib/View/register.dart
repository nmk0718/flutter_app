import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'home.dart';

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
  String email, phone, password,confirm;
  bool autovalidate = false;

  void submitRegisterForm() {
    if (registerFromKey.currentState.validate()) {
      registerFromKey.currentState.save();

      debugPrint('账号: $email');
      debugPrint('账号: $phone');
      debugPrint('密码: $password');
      if (email.length >0 && phone.length >0 && password.length >0 && confirm.length >0) {
        //提示注册中
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('注册成功')));
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => login()),
                (route) => route == null);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('注册失败')));
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
              hintText: '请输入邮箱',
              helperText: '',
            ),
            onSaved: (value) {
              email = value;
            },
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
            onSaved: (value) {
              phone = value;
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
            onSaved: (value) {
              password = value;
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
              hintText: '请确认密码',
              helperText: '',
            ),
            onSaved: (value) {
              confirm = value;
            },
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
