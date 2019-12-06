import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldState();
  }
}

class _TextFieldState extends State<TextFieldWidget> {
  String userName;
  TextEditingController _usernameController = TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameController.text = "hello world";
    _usernameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _usernameController.text.length);
    //监听输入改变
    _usernameController.addListener(() {
      print("用户名：${_usernameController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("输入框")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
              controller: _usernameController,
              focusNode: focusNode1,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock),
              ),
              onChanged: (value) {
                //监听输入改变
                userName = value;
                print("密码：$value");
              },
              focusNode: focusNode2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    //将焦点从从第一个TextField移动到第二个TextField
                    FocusScope.of(context).requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    //当所有编辑框都失去焦点，键盘隐藏
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            ),
            Theme(
                data: Theme.of(context).copyWith(
                    hintColor: Colors.grey[200],
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.grey),
                        //定义label字体样式
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                        )),
                child: Column(children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: "⽤户名",
                        hintText: "⽤户名或邮箱",
                        prefixIcon: Icon(Icons.person)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "密码",
                        hintText: "您的登录密码",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 13.0)),
                    obscureText: true,
                  )
                ])),
            Container(
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "电子邮件地址",
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none)),
              decoration: BoxDecoration(
                  border: Border(
                      // 下滑线浅灰⾊，宽度1像素
                      bottom: BorderSide(color: Colors.grey[200], width: 2.0))),
            ),
          ],
        ),
      ),
    );
  }
}
