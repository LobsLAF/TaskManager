import 'package:flutter/material.dart';

class PlayerLevel with ChangeNotifier {

  double _level = 0;

  double get level => _level;

  void incrementLevel(double value) {
    _level += value;
    // print(_level);
    notifyListeners();
  }
}