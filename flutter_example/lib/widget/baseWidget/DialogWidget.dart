import 'package:flutter/material.dart';

void main() => runApp(DialogApp());

class DialogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Dialog Widget",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dialog Widget"),
        ),
        body: Builder(
            builder: (context) => Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        showAboutDialog(
                            context: context,
                            applicationName: "About Dialog",
                            applicationVersion: "1.0.0");
                      },
                      child: Text("About Dialog"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => SimpleDialog(
                                  title: Text("Simple Dialog"),
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    SimpleDialogOption(
                                      child: Text("Cancel"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ));
                      },
                      child: Text("Simple Dialog"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Alert Dialog"),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text("This is an alert dialog"),
                                        Text("add two options:"),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("Cancel"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ));
                      },
                      child: Text("Alert Dialog"),
                    ),
                  ],
                )),
      ),
    );
  }
}
