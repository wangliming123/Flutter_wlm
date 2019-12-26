import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileOperationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FileOperationState();
}

class _FileOperationState extends State<FileOperationRoute> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //从文件中读取点击次数
    _readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File("$dir/counter.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("文件操作")),
      body: Center(
        child: Text("点击了 $_counter 次"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Increment",
        onPressed: _increment,
      ),
    );
  }

  Future<Null> _increment() async{
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString("$_counter");
  }
}
