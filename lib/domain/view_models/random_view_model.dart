import 'package:flutter/material.dart';

class RandomViewModel extends ChangeNotifier {
  int _counter = 0;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  int get counter => _counter;

  void decreaseCounter() {
    _counter--;
    notifyListeners();
  }

  void increaseCounter() {
    _counter++;
    notifyListeners();
  }
}