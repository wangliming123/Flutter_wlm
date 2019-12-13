import 'package:flutter/material.dart';

class TestGridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView.Builder")),
      //GridView默认构造函数只适用于数量较少的情况，数量较多时使用GridView.Builder
      body: _InfiniteGridView(),
    );
  }
}

class _InfiniteGridView extends StatefulWidget {
  @override
  createState() {
    return _InfiniteGridViewState();
  }
}

class _InfiniteGridViewState extends State<_InfiniteGridView> {
  List<IconData> _icons = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1.0),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        //如果显示到最后⼀个并且Icon总数⼩于200时继续获取数据
        if (index == _icons.length - 1 && _icons.length < 200) {
          _getData();
        }
        return Icon(_icons[index]);
      },
    );
  }

  //模拟异步获取数据
  void _getData() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
