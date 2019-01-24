import 'package:flutter/material.dart';

import 'package:first_flutter_app/screens/PizzaHome.dart';

void main() => runApp(PizzaFlutterApp());

class PizzaFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Simple Layout",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Hello App Bar"),
          ),
          body: PizzaHome(),
        ));
  }
}