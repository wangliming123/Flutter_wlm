import 'package:flutter/material.dart';

Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

class ConstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("布局限制类容器")),
        body: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0,
              ),
              child: Container(
                height: 5.0, //最终高度为50，minWidth生效
                child: redBox,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 80.0, height: 80.0, child: redBox),
                //上面SizedBox等价于下面的ConstrainedBox
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 80.0, height: 80.0),
                    child: redBox,
                  ),
                )
              ],
            ),
            //有多重限制时，对于minWidth和minHeight来说，是取⽗⼦中相应数值较⼤的
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                child: redBox,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),
              //去除父级依赖（minHeight: 100.0仍然生效，只是不影响子元素）
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  child: redBox,
                ),
              ),
            ),
          ],
        ));
  }
}
