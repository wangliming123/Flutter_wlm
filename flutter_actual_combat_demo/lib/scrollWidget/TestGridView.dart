import 'package:flutter/material.dart';

class TestGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView")),
      body: Column(
        children: <Widget>[
          Expanded(
            /*child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //纵轴三个⼦widget
                  childAspectRatio: 1.0),
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),*/
            //上面代码等价于下面代码
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 2.0,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),
          ),
          Expanded(
            /*child: GridView(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100.0, childAspectRatio: 2.0),
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),*/
            //上面代码等价于下面代码
            child: GridView.extent(
              maxCrossAxisExtent: 100.0,
              childAspectRatio: 2.0,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),
          )
        ],
      ),
    );
  }
}
