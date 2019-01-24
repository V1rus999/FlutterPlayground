import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Layout",
    home: Scaffold(
        appBar: AppBar(
          title: Text("Hello App Bar"),
        ),
        body: HelloInput()),
  ));
}

class HelloInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelloInputState();
}

class HelloInputState extends State<HelloInput> {
  String currentInputText = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: "Please input your name."),
            onChanged: handleTextChange,
          ),
          Text("Hello $currentInputText"),
        ],
      ),
    );
  }

  void handleTextChange(String string) {
    setState(() {
      currentInputText = string;
    });
  }
}
