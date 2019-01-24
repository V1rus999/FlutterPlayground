import 'package:flutter/material.dart';

void main() {
  print(createGreeting("Params and return"));
  print(createGreetingOptional("Optional Params and return"));

  try {
    doGreet(createGreeting);
  } on Exception catch (e) {}
}

//{} means optional param and : is used to specify default value
String createGreeting(String name, {String last: "Doe"}) =>
    // => e is the same as {return e;}
    "Hello $name $last";

createGreetingOptional(name) =>
    "Hello " +
    name; //Parameter and return types are optional but its a good practise to include them

typedef String GreeterFunction(String name);

doGreet(GreeterFunction function) {
  print(function("SomeName"));
}
