import 'package:flutter/material.dart';

class PizzaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepOrangeAccent,
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Text(
                "Hawaian",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 30, decoration: TextDecoration.none),
              ),
            ),
            Expanded(
              child: Text(
                "Bacon, Pineapple, Mozarella",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20, decoration: TextDecoration.none),
              ),
            )
          ]),
          Row(children: <Widget>[
            Expanded(
              child: Text(
                "Pulled Pork",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 30, decoration: TextDecoration.none),
              ),
            ),
            Expanded(
              child: Text(
                "Pulled Pork, Rocket, Mozarella",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20, decoration: TextDecoration.none),
              ),
            )
          ]),
          PizzaImageWidget(),
          OrderButton()
        ]),
      ),
    );
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageAsset = AssetImage('images/icon.png');
    var image = Image(
      image: imageAsset,
      width: 150.0,
      height: 150.0,
    );
    return Container(
      child: image,
    );
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50),
      child: RaisedButton(
          child: Text("Order a pizza"),
          color: Colors.lightBlue,
          elevation: 5.0,
          onPressed: () => order(context)),
    );
    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order Completed"),
      content: Text("Thanks for the order"),
    );

    showDialog(context: context, builder: (context) => alert);
  }
}
