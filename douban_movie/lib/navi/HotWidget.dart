import 'package:douban_movie/navi/hot/HotMovieList.dart';
import 'package:douban_movie/repo/StyleRepo.dart';
import 'package:flutter/material.dart';

class HotWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotWidgetState();
  }
}

final _tabTitle = ["正在热映", "即将上映"];

class HotWidgetState extends State<HotWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 50,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: <Widget>[
              Text("武汉", style: StyleRepo.normalTextStyle),
              Icon(Icons.arrow_drop_down),
              Expanded(
                flex: 1,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: StyleRepo.searchTextStyle,
                  decoration: InputDecoration(
                    hintText: '\ue8b6 电影 / 电视剧 / 影人',
                    hintStyle: StyleRepo.hotTitleHintStyle,
                    contentPadding:
                        EdgeInsets.only(top: 8, bottom: 8, right: 10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: DefaultTabController(
            length: _tabTitle.length,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                    unselectedLabelColor: Colors.black12,
                    labelColor: Colors.black87,
                    indicatorColor: Colors.black87,
                    tabs: <Widget>[
                      Tab(text: _tabTitle[0]),
                      Tab(text: _tabTitle[1])
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                          child: HotMovieList(),
                        ),
                        Center(
                          child: Text(_tabTitle[1]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
