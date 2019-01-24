import 'package:flutter/material.dart';

//Constructors can be named
//Everything is public, but _ means lib only (private)
//Every class creates an interface, there is no interface keyword
void main() {
  final emp = Employee("John", "Doe");
  print(emp.first);

  final idEmp = Employee.withId(123);
  print(idEmp.id);

  final acc = Accountant("Jane", "Doe");
  print(acc.first);
}

class Employee extends Object with Logger {
  String first;
  String last;
  int id;

  Employee(this.first, this.last);

  Employee.withId(this.id);

  @override
  String message() {
    return "$first $last $id";
  }
}

//Can use implements which will use the interface version of the accountant.
class Accountant extends Employee with Logger {
  Accountant(String first, String last) : super(first, last);
}

//This is called a mixin, it provides extra functionality to a class.
// It is almost like inheritance, but you can have many mixins providing extra functionality
abstract class Logger {
  void log() {
    print("$message");
  }

  String message();
}
