import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpState();
}

class _HttpState extends State<HttpRoute> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Http请求")),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("httpClient获取百度首页"),
                onPressed: _loading ? null : () async {
                  setState(() {
                    _loading = true;
                    _text = "正在请求...";
                  });
                  try {
                    HttpClient httpClient = new HttpClient();
                    HttpClientRequest request = await httpClient.getUrl(
                        Uri.parse("https://www.baidu.com"));
                    request.headers.add("user-agent",
                        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X)AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                    //等待连接服务器（会将请求信息发送给服务器）
                    HttpClientResponse response = await request.close();
                    //读取相应内容
                    _text = await response.transform(utf8.decoder).join();
                    print(_text);
                    //关闭client后，通过该client发起的所有请求都会中⽌。
                    httpClient.close();
                  } catch (e) {
                    _text = "请求失败: $e";
                  } finally {
                    setState(() {
                      _loading = false;
                    });
                  }
                },
              ),
              RaisedButton(
                child: Text("dio获取百度首页"),
                onPressed: _loading ? null : () async {
                  setState(() {
                    _loading = true;
                    _text = "正在请求...";
                  });
                  Dio dio = new Dio();
                  Response response = await dio.getUri(Uri.parse("https://www.baidu.com"));
                  setState(() {
                    _text = response.data.toString();
                    _loading = false;
                  });
                  dio.close();
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(_text.replaceAll(new RegExp(r"\s"), "")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
