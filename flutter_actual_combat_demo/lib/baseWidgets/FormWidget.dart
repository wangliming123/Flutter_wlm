import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormWidgetState();
  }
}

class _FormWidgetState extends State<FormWidget> {
  GlobalKey _formKey = new GlobalKey();
  TextEditingController _usernameCtrl = new TextEditingController();
  TextEditingController _pwdCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("表单")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey, //设置globalKey，⽤于后⾯获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _usernameCtrl,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)),
                //校验用户名
                validator: (value) {
                  return value.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdCtrl,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock)),
                //校验密码
                validator: (value) {
                  return value.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text("登录1"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          //在这⾥不能通过此⽅式获取FormState，context不对(context是父Widget的context)
                          // print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调⽤validate()⽅法校验⽤户名密码是否合法，校验
                          // 通过后再提交数据。
                          if ((_formKey.currentState as FormState).validate()) {
                            //通过验证提交数据
                            print(
                                "用户名：${_usernameCtrl.text}，密码：${_pwdCtrl.text}");
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Builder(builder: (ctx) {
                        return RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录2"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            //由于本widget也是Form的⼦代widget，所以可以通过下⾯⽅式获取FormState
                            if (Form.of(ctx).validate()) {
                              //通过验证提交数据
                              print(
                                  "用户名：${_usernameCtrl.text}，密码：${_pwdCtrl.text}");
                            }
                          },
                        );
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
