import 'dart:convert';

import 'package:douban_movie/bean/MovieDataEntity.dart';
import 'package:douban_movie/bean/MovieDataEntity.dart' as prefix0;
import 'package:douban_movie/navi/hot/HotMovieItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HotMovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotMovieListState();
  }
}

class HotMovieListState extends State<HotMovieList> {
  List<prefix0.MovieData> movies = new List<prefix0.MovieData>();

  @override
  void initState() {
    super.initState();
    _getMovieData();
  }

  void _getMovieData() async {
//    var client = new Client();

    var response = await http.get(
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=10');
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      MovieDataEntity movieDataEntity = MovieDataEntity.fromJson(responseJson);
      setState(() {
        movies = movieDataEntity.subjects;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (movies == null || movies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
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


}
