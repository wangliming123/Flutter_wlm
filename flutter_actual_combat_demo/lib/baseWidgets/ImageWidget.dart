import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  /*
  Image({
    ...
    this.width, //图⽚的宽
    this.height, //图⽚⾼度
    this.color, //图⽚的混合⾊值
    this.colorBlendMode, //混合模式
    this.fit,//缩放模式
    this.alignment = Alignment.center, //对⻬⽅式
    this.repeat = ImageRepeat.noRepeat, //重复⽅式
    ...
    })
   */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("图片和Icon")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage("assets/images/ic_qq.png"), width: 60),
                Image.asset("assets/images/ic_wx.png", width: 60),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: NetworkImage(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575549609894&di=2c3e700c829a990e3acd04dba09c7a34&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201410%2F06%2F20141006172447_NCfFh.thumb.700_0.jpeg"),
                  width: 60,
                ),
                Image.network(
                  "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3325217006,671225581&fm=26&gp=0.jpg",
                  width: 140.0,
                ),
              ],
            ),
            Image.asset(
              "assets/images/ic_wx.png",
              width: 60,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            Image.asset(
              "assets/images/ic_wx.png",
              width: 200,
              height: 60,
              repeat: ImageRepeat.repeatX,
            ),
            Text(
              "\ue914 \ue000 \ue90d",
              style: TextStyle(
                fontFamily: "materialIcons",
                fontSize: 24.0,
                color: Colors.green,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.accessible, color: Colors.green),
                Icon(Icons.error, color: Colors.green),
                Icon(Icons.fingerprint, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
