import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class TestInfiniteListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("无限加载列表")),
      body: InfiniteListView(),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        if (_words[index] == loadingTag) {
          if (_words.length - 1 < 100) {
            //获取数据
            _getData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载100条数据，不再获取数据
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text("没有更多了", style: TextStyle(color: Colors.grey)),
            );
          }
        }
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _getData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      //每次⽣成20个单词
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}
