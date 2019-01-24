import 'package:flutter/material.dart';
import 'dart:convert' as JSON;

void main() {
  int count; //This is null

  //Types
  //Num = int or double. Numbers are either int or double.

  //String
  String name = "Bob" " Smith";
  var job =
      "Janitor"; //Gets assigned a string, but can be anything. The compiler doesn't assign it a type.
  String greeting = "Hello $name";
  print(greeting);

  //bool Only true is true. 1 is not true for example.

  //List
  //There are no arrays and only lists
  List fruits = ['Apple', 'Pear', 'Orange'];
  List vegetables = List(); //new keyword is optional
  vegetables.add('Tomato');
  vegetables.add('Peas');

  print(fruits);
  print(vegetables);

  //Map
  Map namesAndAges = {
    'joe': 32,
    'bob': 18
  }; //You need to have a string key when declaring like this

  print(namesAndAges);

  //Cascade - Means chaining operations on a single object
  namesAndAges
    ..['jay'] = 23
    ..['amy'] = 12
    ..remove('bob');
  print(namesAndAges);

  //Json
  var data = '{"userId": 1,"id": 1,"title": "delectus aut autem","completed": false}';
  var parsed = JSON.json.decode(data);
  print(parsed);

}
