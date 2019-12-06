import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(TestRoute());

class TestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test Route",
      theme: ThemeData.light(),
      routes: {
        "new_page": (context) => NewRoute(),
      },
      home: TestRoutePage(),
    );
  }
}

class TestRoutePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestRouteState();
  }
}

class TestRouteState extends State<TestRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Route")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("This is Test Route"),
          FlatButton(
            child: Text("open New Route"),
            textColor: Colors.blue,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, "new_page");
//              Navigator.push(context, new MaterialPageRoute(builder: (context) {
//                return new NewRoute();
//              }));
            },
          ),
          RandomWords(),
        ],
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Route")),
      body: Center(
        child: Text("This is New Route"),
      ),
    );
  }
}

class RandomWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}
