import 'package:flutter/material.dart';

class TestListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复⽤
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
        appBar: AppBar(title: Text("ListView")),
        body: Column(
          children: <Widget>[
            ListTile(title: Text("商品列表")),
            Expanded(
              //ListView默认构造函数适合只有少量的⼦widget的情况
              //因为这种⽅式需要将所有children都提前创建好（这需要做⼤量⼯作）
              //通过此⽅式创建的ListView和使⽤SingleChildScrollView+Column的⽅式没有本质的区别
              /*child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  const Text('I\'m dedicating every day to you'),
                  const Text('Domestic life was never quite my style'),
                  const Text('When you smile, you knock me out, I fall apart'),
                  const Text('And I thought I was so smart'),
                ],
              ),*/

              /*child: ListView.builder(
                itemCount: 100,
                itemExtent: 50.0, //强制高度为50.0
                itemBuilder: (context, index) =>
                    ListTile(title: Text("$index")),
              ),*/

              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(title: Text("$index")),
                separatorBuilder: (context, index) =>
                index % 2 == 0 ? divider1 : divider2,
                itemCount: 100,
              ),
            ),
          ],
        ));
  }
}
