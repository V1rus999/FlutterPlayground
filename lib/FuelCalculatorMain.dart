import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Trip Cost Calc",
    home: Scaffold(
        appBar: AppBar(
          title: Text("Hello App Bar"),
        ),
        body: FuelCalculator()),
  ));
}

class FuelCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FuelCalculatorState();
  }
}

class FuelCalculatorState extends State<FuelCalculator> {
  final _currencies = ['Dollars', 'Euro', 'Pound'];
  var _currency = 'Dollars';
  var _result = "";
  var _distanceController = TextEditingController();
  var _consumptionController = TextEditingController();
  var _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.title;
    return Material(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _distanceController,
                decoration: InputDecoration(
                    hintText: "eg 124",
                    labelStyle: textStyle,
                    labelText: "Distance",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _consumptionController,
                decoration: InputDecoration(
                    hintText: "eg 17",
                    labelStyle: textStyle,
                    labelText: "Distance per Unit (km/L)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _priceController,
                decoration: InputDecoration(
                    hintText: "eg 14.5",
                    labelStyle: textStyle,
                    labelText: "Price",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
              ),
            ),
            DropdownButton<String>(
              items: _currencies.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: _currency,
              onChanged: (string) => dropDownChanged(string),
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text("Submit"),
                      onPressed: () => calculateCost(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text("Reset"),
                      onPressed: () => resetButtons(),
                    ),
                  ),
                ],
              ),
            ),
            Text(_result)
          ],
        ),
      ),
    );
  }

  void resetButtons() {
    _distanceController.text = "";
    _consumptionController.text = "";
    _priceController.text = "";
    setState(() {
      _result = "";
    });
  }

  void calculateCost() {
    num totalCost;
    var error;
    try {
      num _distance = double.parse(_distanceController.text);
      num _consumption = double.parse(_consumptionController.text);
      num _fuelcost = double.parse(_priceController.text);
      totalCost = (_distance / _consumption) * _fuelcost;
    } on Exception catch (e) {
      error = e.toString();
    }
    setState(() {
      if (totalCost == null) {
        _result = error;
      } else {
        _result =
            "The total cost of the trip is ${totalCost.toStringAsFixed(2)} $_currency";
      }
    });
  }

  void dropDownChanged(String string) {
    setState(() {
      _currency = string;
    });
  }
}
