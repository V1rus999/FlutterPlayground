import 'package:first_flutter_app/screens/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(HelloFlutterApp());

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Simple Layout",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Hello App Bar"),
          ),
          body: Home(),
        ));
  }
}
