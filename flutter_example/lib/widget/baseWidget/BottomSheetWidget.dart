
import 'package:flutter/material.dart';

void main() => runApp(BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "BottomSheet Widget",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("bottomSheet Widget"),),
        body: Builder(
          builder: (context) => Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) => BottomSheet(
                        onClosing: () {},
                        builder: (context) => Container(
                          height: 200.0,
                          color: Colors.blue,
                          child: Center(
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("dismissBottomSheet"),
                            ),
                          ),
                        ),
                      )
                  );
                },
                child: Text("showBottomSheet"),
              ),
              RaisedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomSheet(
                        onClosing: () {},
                        builder: (context) => Container(
                          height: 200.0,
                          color: Colors.blue,
                          child: Center(
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("dismissBottomSheet"),
                            ),
                          ),
                        ),
                      )
                  );
                },
                child: Text("showModalBottomSheet"),
              )
            ],
          ),
        ),
      ),
    );
  }

}