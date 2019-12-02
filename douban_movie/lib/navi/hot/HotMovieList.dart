import 'package:douban_movie/bean/MovieData.dart';
import 'package:douban_movie/navi/hot/HotMovieItem.dart';
import 'package:flutter/material.dart';

class HotMovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotMovieListState();
  }
}

class HotMovieListState extends State<HotMovieList> {
  List<MovieData> movies = new List<MovieData>();

  @override
  void initState() {
    super.initState();
    var data = MovieData('反贪风暴4', 6.3, '林德禄', '古天乐/郑嘉颖/林峯', 29013,
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551353482.webp');
    setState(() {
      movies.add(data);
      movies.add(data);
      movies.add(data);
      movies.add(data);
      movies.add(data);
      movies.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return HotMovieItem(movies[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(height: 1, color: Colors.black26);
      },
      itemCount: movies.length,
    );
  }
}
