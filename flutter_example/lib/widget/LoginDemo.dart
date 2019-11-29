import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //去掉状态栏透明层
  if (Platform.isAndroid) {
    var style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextStyle _blackStyle = const TextStyle(
    fontSize: 14,
    textBaseline: TextBaseline.alphabetic,
    color: Color(0xFF333333),
  );
  final TextStyle _whiteStyle = const TextStyle(
    fontSize: 14,
    color: Colors.white,
  );
  final TextStyle _blueStyle = const TextStyle(
    fontSize: 14,
    color: Colors.lightBlue,
  );

  final FocusNode _pwdFocus = FocusNode();
  final TextEditingController _accountController =
      TextEditingController(text: '13512341235');
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("登录"),
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ClipOval(
                child: Image.asset(
                  "images/img_head.jpg",
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            TextField(
              style: _blackStyle,
              controller: _accountController,
              maxLength: 11,
              autofocus: false,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_pwdFocus);
              },
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]"))
              ],
              decoration: const InputDecoration(
                icon: ImageIcon(
                  AssetImage("images/ic_phone.png"),
                  size: 22,
                  color: Colors.grey,
                ),
                counterText: '',
                hintText: "请输入手机号",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              style: _blackStyle,
              controller: _pwdController,
              obscureText: true,
              maxLength: 20,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              focusNode: _pwdFocus,
              inputFormatters: [
                BlacklistingTextInputFormatter(RegExp("\u4e00-\u9fa5"))
              ],
              decoration: const InputDecoration(
                icon: ImageIcon(
                  AssetImage('images/ic_password.png'),
                  size: 22,
                  color: Colors.grey,
                ),
                counterText: '',
                hintText: "请输入密码",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: <Widget>[
                  Text.rich(TextSpan(
                    text: '登录即同意',
                    children: [
                      TextSpan(
                        text: '《用户隐私协议》',
                        style: _blueStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => _showInfoDialog('这是用户隐私协议'),
                      ),
                    ],
                    style: _blackStyle,
                  )),
                  Spacer(),
                  Text(
                    '忘记密码？',
                    style: _blueStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.lightBlue,
              onPressed: () {
                _showInfoDialog(
                    '帐号：${_accountController.text} \n ${_pwdController.text}');
              },
              child: Text(
                '登录',
                style: _whiteStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Text(
                '--------------  第三方登录  --------------',
                style: _blackStyle,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'images/ic_wx.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 60,),
                  Image.asset(
                    'images/ic_qq.png',
                    width: 50,
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _accountController.dispose();
    _pwdController.dispose();
    _pwdFocus.dispose();
    super.dispose();
  }

  void _showInfoDialog(String content) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                child: Text(content),
              ),
            ],
          );
        });
  }
}
