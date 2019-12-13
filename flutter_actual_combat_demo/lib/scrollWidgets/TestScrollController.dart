import 'package:flutter/material.dart';

class TestScrollController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerState();
  }
}

class _ScrollControllerState extends State<TestScrollController> {
  ScrollController _controller = new ScrollController(keepScrollOffset: true);
  bool showToTopBtn = false; //是否显示‘返回到顶部’按钮

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调⽤_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动监听及控制")),
      body: Scrollbar(
        child: ListView.builder(
          key: PageStorageKey(10001),
          itemCount: 100,
          itemExtent: 50.0,
          //列表项⾼度固定时，显式指定⾼度是⼀个好习惯(性能消耗⼩)
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(title: Text("$index"));
          },
        ),
      ),
      floatingActionButton: showToTopBtn
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回顶部动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            )
          : null,
    );
  }
}
