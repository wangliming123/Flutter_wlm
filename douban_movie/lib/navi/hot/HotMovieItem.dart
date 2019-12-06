import 'package:douban_movie/bean/MovieDataEntity.dart' as prefix0;
import 'package:douban_movie/repo/StyleRepo.dart';
import 'package:flutter/material.dart';

class HotMovieItem extends StatefulWidget {
  final prefix0.MovieData movieData;

  HotMovieItem(this.movieData);

  @override
  State<StatefulWidget> createState() {
    return HotMovieItemState();
  }
}

class HotMovieItemState extends State<HotMovieItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(widget.movieData.images.small,
              width: 80, height: 120, fit: BoxFit.cover),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.movieData.title,
                    style: StyleRepo.movieItemTitleStyle,
                  ),
                  Text(
                    widget.movieData.rating.toString(),
                    style: StyleRepo.movieItemNormalStyle,
                  ),
                  Text(
                    "导演：${widget.movieData.directors}",
                    style: StyleRepo.movieItemNormalStyle,
                  ),
                  Text(
                    "主演：${widget.movieData.casts}",
                    style: StyleRepo.movieItemNormalStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${widget.movieData.collectCount}人看过",
                  style: StyleRepo.movieItemRedStyle,
                ),
                OutlineButton(
                  child: Text("购票", style: StyleRepo.normalTextStyle),
                  color: Colors.red,
                  textColor: Colors.red,
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(
                    color: Colors.red
                  ),
                  onPressed: (){},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
